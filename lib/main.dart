import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:data/init_mappers.dart';
import 'package:domain/domain.dart';
import 'package:presentation/routing/app_router.dart';
import 'package:presentation/providers/usecase_providers.dart';
import 'providers.dart' as root_providers;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await dotenv.load(fileName: ".env");
  initializeMappers();

  runApp(
    ProviderScope(
      overrides: [
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
        subscribeSingleTickerUseCaseProvider.overrideWith((ref) {
          return SubscribeSingleTickerUseCaseImpl(
            repository: ref.watch(root_providers.coinRepositoryProvider),
          );
        }),
        getSettingsUseCaseProvider.overrideWith((ref) {
          return GetSettingsUseCaseImpl(
            repository: ref.watch(root_providers.settingsRepositoryProvider),
          );
        }),
        saveSettingsUseCaseProvider.overrideWith((ref) {
          return SaveSettingsUseCaseImpl(
            repository: ref.watch(root_providers.settingsRepositoryProvider),
          );
        }),
        getExchangeRateUseCaseProvider.overrideWith((ref) {
          return GetExchangeRateUseCaseImpl(
            repository: ref.watch(root_providers.exchangeRateRepositoryProvider),
          );
        }),
        getChartDataUseCaseProvider.overrideWith((ref) {
          return GetChartDataUseCaseImpl(
            repository: ref.watch(root_providers.coinRepositoryProvider),
          );
        }),
        getNewsUseCaseProvider.overrideWith((ref) {
          return GetNewsUseCaseImpl(
            repository: ref.watch(root_providers.newsRepositoryProvider),
          );
        }),
        analyzeCoinUseCaseProvider.overrideWith((ref) {
          return AnalyzeCoinUseCaseImpl(
            repository: ref.watch(root_providers.aiRepositoryProvider),
          );
        }),
        aiRepositoryProvider.overrideWith((ref) {
          return ref.watch(root_providers.aiRepositoryProvider);
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
