import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:data/init_mappers.dart';
import 'package:domain/domain.dart';
import 'package:presentation/routing/app_router.dart';
import 'package:presentation/providers/usecase_providers.dart';
import 'providers.dart' as root_providers;

void main() {
  // Mapper 초기화
  initializeMappers();

  runApp(
    ProviderScope(
      overrides: [
        // Presentation의 UseCase provider를 실제 구현체로 override
        getCoinListUseCaseProvider.overrideWith((ref) {
          return GetCoinListUseCaseImpl(
            repository: ref.watch(root_providers.coinRepositoryProvider),
          );
        }),
        subscribeCoinTickerUseCaseProvider.overrideWith((ref) {
          return SubscribeCoinTickerUseCaseImpl(
            repository: ref.watch(root_providers.coinRepositoryProvider),
          );
        }),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Crypto Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      routerConfig: appRouter,
    );
  }
}
