import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:presentation/splash/splash_state.dart';
import 'package:presentation/splash/splash_event.dart';

part 'splash_notifier.g.dart';

@riverpod
class SplashNotifier extends _$SplashNotifier {
  @override
  SplashState build() {
    // 초기 상태
    return const SplashState.initial();
  }

  /// 이벤트 처리
  void onEvent(SplashEvent event) {
    event.when(
      initialize: _handleInitialize,
      retry: _handleRetry,
    );
  }

  Future<void> _handleInitialize() async {
    state = const SplashState.loading();

    try {
      // TODO: 앱 초기화 로직 (Mapper 초기화, 설정 로드 등)
      await Future.delayed(const Duration(seconds: 2));
      state = const SplashState.completed();
    } catch (e) {
      state = SplashState.error('초기화 실패: $e');
    }
  }

  Future<void> _handleRetry() async {
    await _handleInitialize();
  }
}
