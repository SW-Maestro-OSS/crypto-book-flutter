import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation/home/home_view.dart';
import 'package:presentation/settings/setting_view.dart';
import 'package:presentation/main/main_state.dart';
import 'package:presentation/main/main_viewmodel.dart';
import 'package:presentation/main/main_intent.dart';
import 'package:presentation/routing/navigation_state.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(mainViewModelProvider);

    // Listen to navigation state changes and execute navigation
    ref.listen<MainState>(
      mainViewModelProvider,
      (previous, next) {
        _handleNavigationState(context, next.navigationState);
      },
    );

    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: state.currentTabIndex,
          children: const [
            HomeView(),
            SettingView(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: state.currentTabIndex,
        onTap: (index) {
          ref.read(mainViewModelProvider.notifier).onIntent(
                MainIntent.changeTab(index),
              );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Market',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
      ),
    );
  }

  /// Handle navigation state changes
  ///
  /// This is where BuildContext-dependent navigation actually happens
  void _handleNavigationState(
    BuildContext context,
    NavigationState navigationState,
  ) {
    navigationState.when(
      idle: () {
        // No action needed
      },
      navigateTo: (pageType, pathParams, queryParams, extra) {
        final path = pageType.buildPath(
          pathParams: pathParams,
          queryParams: queryParams,
        );
        context.go(path, extra: extra);

        // Notify ViewModel that navigation is complete
        ref.read(mainViewModelProvider.notifier).onIntent(
              const MainIntent.navigationCompleted(),
            );
      },
      pushTo: (pageType, pathParams, queryParams, extra) {
        final path = pageType.buildPath(
          pathParams: pathParams,
          queryParams: queryParams,
        );
        context.push(path, extra: extra);

        // Notify ViewModel that navigation is complete
        ref.read(mainViewModelProvider.notifier).onIntent(
              const MainIntent.navigationCompleted(),
            );
      },
      goBack: () {
        if (context.canPop()) {
          context.pop();
        }

        // Notify ViewModel that navigation is complete
        ref.read(mainViewModelProvider.notifier).onIntent(
              const MainIntent.navigationCompleted(),
            );
      },
      navigateToTab: (tabIndex) {
        // Tab navigation is already handled by state change
        // This case is here for completeness but might not be used
        ref.read(mainViewModelProvider.notifier).onIntent(
              MainIntent.changeTab(tabIndex),
            );
      },
      replaceAll: (pageType) {
        final path = pageType.buildPath();
        // Clear stack and navigate
        while (context.canPop()) {
          context.pop();
        }
        context.go(path);

        // Notify ViewModel that navigation is complete
        ref.read(mainViewModelProvider.notifier).onIntent(
              const MainIntent.navigationCompleted(),
            );
      },
    );
  }
}

