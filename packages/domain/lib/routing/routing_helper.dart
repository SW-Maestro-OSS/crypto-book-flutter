import 'package:domain/routing/page_type.dart';

/// Navigation helper interface
///
/// This interface is implemented in the Presentation layer
/// and injected into ViewModels for navigation.
abstract interface class RoutingHelper {
  /// Navigate to a specific page, replacing current route
  ///
  /// This is equivalent to context.go() in GoRouter
  void navigateTo(
    PageType pageType, {
    Map<String, String>? pathParams,
    Map<String, String>? queryParams,
    Object? extra,
  });

  /// Push a new page onto the navigation stack
  ///
  /// This is equivalent to context.push() in GoRouter
  void pushTo(
    PageType pageType, {
    Map<String, String>? pathParams,
    Map<String, String>? queryParams,
    Object? extra,
  });

  /// Go back to the previous page
  void goBack();

  /// Check if we can go back
  bool canGoBack();

  /// Navigate to a tab within MainPage
  ///
  /// This is a special case for tab navigation
  void navigateToTab(int tabIndex);

  /// Replace the entire navigation stack with a new route
  void replaceAll(PageType pageType);
}
