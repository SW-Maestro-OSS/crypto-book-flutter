import 'package:go_router/go_router.dart';
import 'package:presentation/splash/splash_page.dart';
import 'package:presentation/main/main_page.dart';
import 'package:presentation/coin_detail/coin_detail_page.dart';

final appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/main',
      builder: (context, state) => const MainPage(),
    ),
    GoRoute(
      path: '/coin/:symbol',
      builder: (context, state) {
        final symbol = state.pathParameters['symbol']!;
        return CoinDetailPage(symbol: symbol);
      },
    ),
  ],
);
