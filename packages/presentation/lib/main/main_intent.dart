import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_intent.freezed.dart';

/// Main screen intents
@freezed
sealed class MainIntent with _$MainIntent {
  /// Change tab
  const factory MainIntent.changeTab(int tabIndex) = _ChangeTab;

  /// Navigation completed (called by MainPage after navigation)
  const factory MainIntent.navigationCompleted() = _NavigationCompleted;

  /// Handle deep link
  const factory MainIntent.handleDeepLink(String path) = _HandleDeepLink;
}
