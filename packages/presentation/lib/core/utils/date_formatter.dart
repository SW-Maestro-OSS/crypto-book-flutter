import 'package:presentation/core/l10n/app_strings.dart';

class DateFormatter {
  static String timeAgo(DateTime dateTime, AppStrings strings) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return strings.get('just_now');
    } else if (difference.inMinutes < 60) {
      return strings.get('minutes_ago',
          params: ['${difference.inMinutes}']);
    } else if (difference.inHours < 24) {
      return strings.get('hours_ago',
          params: ['${difference.inHours}']);
    } else {
      return strings.get('days_ago',
          params: ['${difference.inDays}']);
    }
  }
}
