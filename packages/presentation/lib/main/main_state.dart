import 'package:presentation/routing/navigation_state.dart';

/// Main screen state
class MainState {
  /// Current selected tab index (0 = Home, 1 = Settings)
  final int currentTabIndex;

  /// Pending navigation action
  final NavigationState navigationState;

  const MainState({
    this.currentTabIndex = 0,
    this.navigationState = const NavigationState.idle(),
  });

  MainState copyWith({
    int? currentTabIndex,
    NavigationState? navigationState,
  }) {
    return MainState(
      currentTabIndex: currentTabIndex ?? this.currentTabIndex,
      navigationState: navigationState ?? this.navigationState,
    );
  }
}
