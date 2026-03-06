import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:presentation/main/main_state.dart';
import 'package:presentation/main/main_intent.dart';
import 'package:presentation/routing/navigation_state.dart';
import 'package:presentation/routing/routing_helper_impl.dart';
import 'package:presentation/core/mvi/websocket_subscription_mixin.dart';
import 'package:presentation/providers/usecase_providers.dart';
import 'package:domain/domain.dart';

part 'main_viewmodel.g.dart';

/// Main screen ViewModel
///
/// 앱 라이프사이클 + WebSocket 연결 + 네트워크 상태를 관리한다.
@riverpod
class MainViewModel extends _$MainViewModel with WebSocketSubscriptionMixin {
  late final RoutingHelper _routingHelper;
  bool _isForeground = true;
  StreamSubscription? _networkSubscription;

  @override
  MainState build() {
    _routingHelper = RoutingHelperImpl(
      onNavigationStateChanged: _updateNavigationState,
    );

    // WebSocket 상태 구독 (mixin)
    final wsRepo = ref.read(webSocketRepositoryProvider);
    subscribeWebSocket(wsRepo.connectionState);

    // 네트워크 상태 감시
    final networkRepo = ref.read(networkRepositoryProvider);
    _networkSubscription = networkRepo.statusStream.listen((status) {
      if (status == NetworkStatus.online && _isForeground) {
        _connectWebSocketIfDisconnected();
      }
    });

    ref.onDispose(() {
      disposeWebSocketSubscription();
      _networkSubscription?.cancel();
    });

    return MainState();
  }

  /// Get the RoutingHelper instance
  RoutingHelper get routingHelper => _routingHelper;

  /// Handle intents
  void onIntent(MainIntent intent) {
    intent.when(
      changeTab: _handleChangeTab,
      navigationCompleted: _handleNavigationCompleted,
      handleDeepLink: _handleDeepLink,
      appResumed: _handleAppResumed,
      appPaused: _handleAppPaused,
    );
  }

  void _handleAppResumed() {
    _isForeground = true;
    ref.read(webSocketRepositoryProvider).setForeground(true);
    _connectWebSocketIfDisconnected();
  }

  void _handleAppPaused() {
    _isForeground = false;
    ref.read(webSocketRepositoryProvider).setForeground(false);
  }

  void _connectWebSocketIfDisconnected() {
    final wsRepo = ref.read(webSocketRepositoryProvider);
    if (!wsRepo.isConnected) {
      wsRepo.reconnect();
    }
  }

  void _handleChangeTab(int tabIndex) {
    state = state.copyWith(currentTabIndex: tabIndex);
  }

  void _handleNavigationCompleted() {
    state = state.copyWith(
      navigationState: const NavigationState.idle(),
    );
  }

  void _handleDeepLink(String path) {
    final pageType = PageType.fromPath(path);
    if (pageType == null) {
      _updateNavigationState(
        const NavigationState.navigateTo(pageType: PageType.main),
      );
      return;
    }

    final params = PageType.extractParams(path);

    switch (pageType) {
      case PageType.splash:
        _updateNavigationState(
          const NavigationState.navigateTo(pageType: PageType.main),
        );
        break;

      case PageType.main:
        final tabParam = params.getQueryParam('tab');
        if (tabParam != null) {
          final tabIndex = int.tryParse(tabParam) ?? 0;
          state = state.copyWith(currentTabIndex: tabIndex);
        }
        _updateNavigationState(
          const NavigationState.navigateTo(pageType: PageType.main),
        );
        break;

      case PageType.coinDetail:
        _updateNavigationState(
          NavigationState.pushTo(
            pageType: PageType.coinDetail,
            pathParams: params.pathParams,
          ),
        );
        break;

      case PageType.home:
      case PageType.settings:
        _updateNavigationState(
          const NavigationState.navigateTo(pageType: PageType.main),
        );
        break;
    }
  }

  void _updateNavigationState(NavigationState navigationState) {
    state = state.copyWith(navigationState: navigationState);
  }
}

/// Provider for RoutingHelper
@riverpod
RoutingHelper routingHelper(Ref ref) {
  return ref.watch(mainViewModelProvider.notifier).routingHelper;
}
