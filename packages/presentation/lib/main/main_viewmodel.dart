import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:presentation/main/main_state.dart';
import 'package:presentation/main/main_intent.dart';
import 'package:presentation/routing/navigation_state.dart';
import 'package:presentation/routing/routing_helper_impl.dart';
import 'package:domain/domain.dart';

part 'main_viewmodel.g.dart';

/// Main screen ViewModel
///
/// This ViewModel manages:
/// - Tab selection state
/// - Navigation state for child ViewModels
@riverpod
class MainViewModel extends _$MainViewModel {
  late final RoutingHelper _routingHelper;

  @override
  MainState build() {
    // Create RoutingHelper with callback
    _routingHelper = RoutingHelperImpl(
      onNavigationStateChanged: _updateNavigationState,
    );

    return MainState();
  }

  /// Get the RoutingHelper instance
  /// This will be provided to other ViewModels
  RoutingHelper get routingHelper => _routingHelper;

  /// Handle intents
  void onIntent(MainIntent intent) {
    intent.when(
      changeTab: _handleChangeTab,
      navigationCompleted: _handleNavigationCompleted,
      handleDeepLink: _handleDeepLink,
    );
  }

  void _handleChangeTab(int tabIndex) {
    state = state.copyWith(currentTabIndex: tabIndex);
  }

  void _handleNavigationCompleted() {
    // Reset navigation state to idle after navigation is handled
    state = state.copyWith(
      navigationState: const NavigationState.idle(),
    );
  }

  void _handleDeepLink(String path) {
    // Parse the deep link path
    final pageType = PageType.fromPath(path);
    if (pageType == null) {
      // Unknown route, navigate to main
      _updateNavigationState(
        const NavigationState.navigateTo(pageType: PageType.main),
      );
      return;
    }

    // Extract parameters
    final params = PageType.extractParams(path);

    // Handle based on page type
    switch (pageType) {
      case PageType.splash:
        // Deep link to splash doesn't make sense, go to main
        _updateNavigationState(
          const NavigationState.navigateTo(pageType: PageType.main),
        );
        break;

      case PageType.main:
        // Check if tab is specified
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
        // Navigate to coin detail
        // This will push the detail page on top of main page
        _updateNavigationState(
          NavigationState.pushTo(
            pageType: PageType.coinDetail,
            pathParams: params.pathParams,
          ),
        );
        break;

      case PageType.home:
      case PageType.settings:
        // These are tab-only routes, navigate to main
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
///
/// This allows other ViewModels to access the RoutingHelper
@riverpod
RoutingHelper routingHelper(Ref ref) {
  return ref.watch(mainViewModelProvider.notifier).routingHelper;
}
