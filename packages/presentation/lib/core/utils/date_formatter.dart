import 'package:intl/intl.dart';
import 'package:domain/domain.dart';
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

  /// 차트 X축 라벨 포맷
  static String formatChartLabel(DateTime dateTime, ChartTimeframe timeframe) {
    switch (timeframe) {
      case ChartTimeframe.h24:
        return DateFormat('HH:mm').format(dateTime);
      case ChartTimeframe.d7:
      case ChartTimeframe.m1:
        return DateFormat('MM/dd').format(dateTime);
    }
  }

  /// 차트 툴팁 타임스탬프 포맷
  static String formatChartTimestamp(DateTime dateTime, ChartTimeframe timeframe) {
    switch (timeframe) {
      case ChartTimeframe.h24:
        return DateFormat('MMM dd HH:mm').format(dateTime);
      case ChartTimeframe.d7:
      case ChartTimeframe.m1:
        return DateFormat('MMM dd, yyyy').format(dateTime);
    }
  }
}
