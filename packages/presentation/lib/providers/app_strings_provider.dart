import 'package:presentation/core/l10n/app_strings.dart';
import 'package:presentation/providers/app_settings_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_strings_provider.g.dart';

@riverpod
AppStrings appStrings(Ref ref) {
  final settings = ref.watch(appSettingsProvider);
  return AppStrings(settings.language);
}
