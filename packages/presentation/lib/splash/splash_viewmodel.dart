import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:presentation/splash/splash_state.dart';
import 'package:presentation/splash/splash_intent.dart';

part 'splash_viewmodel.g.dart';

/// Splash 화면의 ViewModel (비즈니스 로직)
@riverpod
class SplashViewModel extends _$SplashViewModel {
  @override
  SplashState build() {
    // 초기 상태
    return const SplashState.initial();
  }

  /// Intent 처리
  void onIntent(SplashIntent intent) {
    intent.when(
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
