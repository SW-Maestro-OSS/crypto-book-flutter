import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation/splash/splash_notifier.dart';
import 'package:presentation/splash/splash_state.dart';
import 'package:presentation/splash/splash_event.dart';

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
      ref.read(splashProvider.notifier).onEvent(
            const SplashEvent.initialize(),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(splashProvider);

    // State에 따라 화면 전환
    ref.listen(splashProvider, (previous, next) {
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
              const Icon(Icons.paid, size: 160, color: Colors.grey),
              const SizedBox(height: 24),
              Text(
                'Coin Viewer',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ],
          ),
          completed: () => const SizedBox.shrink(),
          error: (message) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 80, color: Colors.red),
              const SizedBox(height: 16),
              Text(message),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ref.read(splashProvider.notifier).onEvent(
                        const SplashEvent.retry(),
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
