import 'package:domain/domain.dart';
import 'package:presentation/routing/navigation_state.dart';

/// Implementation of RoutingHelper
///
/// This class bridges the gap between ViewModels (which can't access BuildContext)
/// and the actual navigation system (which requires BuildContext).
///
/// It works by updating a navigation state that MainPage listens to.
class RoutingHelperImpl implements RoutingHelper {
  /// Callback to update navigation state
  /// This will be provided by MainViewModel
  final void Function(NavigationState) _onNavigationStateChanged;

  RoutingHelperImpl({
    required void Function(NavigationState) onNavigationStateChanged,
  }) : _onNavigationStateChanged = onNavigationStateChanged;

  @override
  void navigateTo(
    PageType pageType, {
    Map<String, String>? pathParams,
    Map<String, String>? queryParams,
    Object? extra,
  }) {
    _onNavigationStateChanged(
      NavigationState.navigateTo(
        pageType: pageType,
        pathParams: pathParams ?? {},
        queryParams: queryParams ?? {},
        extra: extra,
      ),
    );
  }

  @override
  void pushTo(
    PageType pageType, {
    Map<String, String>? pathParams,
    Map<String, String>? queryParams,
    Object? extra,
  }) {
    _onNavigationStateChanged(
      NavigationState.pushTo(
        pageType: pageType,
        pathParams: pathParams ?? {},
        queryParams: queryParams ?? {},
        extra: extra,
      ),
    );
  }

  @override
  void goBack() {
    _onNavigationStateChanged(const NavigationState.goBack());
  }

  @override
  bool canGoBack() {
    // This would need to be enhanced to track actual navigation stack
    // For now, return true - the actual check happens in MainPage
    return true;
  }

  @override
  void navigateToTab(int tabIndex) {
    _onNavigationStateChanged(
      NavigationState.navigateToTab(tabIndex: tabIndex),
    );
  }

  @override
  void replaceAll(PageType pageType) {
    _onNavigationStateChanged(
      NavigationState.replaceAll(pageType: pageType),
    );
  }
}
