import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:data/init_mappers.dart';
import 'package:domain/domain.dart';
import 'package:presentation/routing/app_router.dart';
import 'package:presentation/providers/usecase_providers.dart';
import 'package:presentation/theme/app_theme.dart';
import 'package:presentation/theme/theme_mode_provider.dart';
import 'providers.dart' as root_providers;

Future<void> main() async {
  // Flutter 엔진 초기화
  WidgetsFlutterBinding.ensureInitialized();

  // Hive 초기화 (캐싱을 위한 로컬 스토리지)
  await Hive.initFlutter();

  // 환경 변수 로드
  await dotenv.load(fileName: ".env");

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

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Crypto Tracker',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,
      routerConfig: appRouter,
    );
  }
}
