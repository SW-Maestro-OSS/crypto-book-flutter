import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation/splash/splash_viewmodel.dart';
import 'package:presentation/splash/splash_state.dart';
import 'package:presentation/splash/splash_intent.dart';
import 'package:presentation/theme/extensions/context_extensions.dart';
import 'package:presentation/theme/spacing/app_spacing.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    // 초기화 이벤트 발생
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(splashViewModelProvider.notifier).onIntent(
            const SplashIntent.initialize(),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(splashViewModelProvider);

    // State에 따라 화면 전환
    // NOTE: Splash는 앱 최초 진입이라 context.go() 직접 사용
    // MainViewModel이 아직 초기화되지 않았을 수 있음
    ref.listen(splashViewModelProvider, (previous, next) {
      next.whenOrNull(
        completed: () => context.go('/main'),
      );
    });

    return Scaffold(
      body: Center(
        child: state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.paid,
                  size: 160,
                  color: context.colorScheme.primary.withOpacity(0.5)),
              SizedBox(height: AppSpacing.lg),
              Text(
                'Coin Viewer',
                style: context.textTheme.headlineLarge,
              ),
            ],
          ),
          completed: () => const SizedBox.shrink(),
          error: (message) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline,
                  size: 80, color: context.colorScheme.error),
              SizedBox(height: AppSpacing.md),
              Text(message),
              SizedBox(height: AppSpacing.md),
              ElevatedButton(
                onPressed: () {
                  ref.read(splashViewModelProvider.notifier).onIntent(
                        const SplashIntent.retry(),
                      );
                },
                child: const Text('재시도'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
