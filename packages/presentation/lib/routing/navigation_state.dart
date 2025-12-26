import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'navigation_state.freezed.dart';

/// Navigation state representing a navigation intent
///
/// This is used by MainViewModel to communicate navigation
/// actions to MainPage, which has access to BuildContext.
@freezed
sealed class NavigationState with _$NavigationState {
  /// No navigation action pending
  const factory NavigationState.idle() = _Idle;

  /// Navigate to a page (replace current)
  const factory NavigationState.navigateTo({
    required PageType pageType,
    @Default({}) Map<String, String> pathParams,
    @Default({}) Map<String, String> queryParams,
    Object? extra,
  }) = _NavigateTo;

  /// Push a page onto stack
  const factory NavigationState.pushTo({
    required PageType pageType,
    @Default({}) Map<String, String> pathParams,
    @Default({}) Map<String, String> queryParams,
    Object? extra,
  }) = _PushTo;

  /// Go back
  const factory NavigationState.goBack() = _GoBack;

  /// Navigate to a specific tab
  const factory NavigationState.navigateToTab({
    required int tabIndex,
  }) = _NavigateToTab;

  /// Replace entire navigation stack
  const factory NavigationState.replaceAll({
    required PageType pageType,
  }) = _ReplaceAll;
}
