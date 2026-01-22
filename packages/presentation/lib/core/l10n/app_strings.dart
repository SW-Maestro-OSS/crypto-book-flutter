/// Simple i18n string resources
///
/// For a more robust solution, consider using flutter_localizations
class AppStrings {
  final String languageCode;

  AppStrings(this.languageCode);

  static final Map<String, Map<String, String>> _localizedStrings = {
    'en': {
      // Navigation
      'market': 'Market',
      'settings': 'Settings',

      // Home page
      'search_coins': 'Search coins...',
      'no_coins_found': 'No coins found',
      'scroll_for_more': 'Scroll down for more...',

      // Sort header
      'symbol': 'Symbol',
      'price': 'Price',
      'change_24h': '24h %',

      // Settings page
      'currency': 'Currency',
      'language': 'Language',
      'exchange_rate': 'Exchange Rate',
      'refresh': 'Refresh',
      'last_updated': 'Last updated',
      'just_now': 'just now',
      'minutes_ago': '{0} minutes ago',
      'hours_ago': '{0} hours ago',
      'days_ago': '{0} days ago',

      // Currency options
      'usd': 'US Dollar',
      'krw': 'Korean Won',

      // Language options
      'english': 'English',
      'korean': 'Korean',

      // Coin detail page
      'high_24h': '24h High',
      'low_24h': '24h Low',
      'volume_24h': '24h Volume',
      'market_cap': 'Market Cap',
      'open_price': 'Open Price',
      'circulating_supply': 'Circulating Supply',
      'coming_soon': 'Coming soon',

      // Chart
      '24h': '24H',
      '7d': '7D',
      '1m': '1M',

      // AI Insight
      'ai_insight': 'AI Insight',
      'buy_pressure': 'Buy Pressure',
      'sell_pressure': 'Sell Pressure',

      // News
      'related_articles': 'Related Articles',

      // Errors
      'error_occurred': 'An error occurred',
      'retry': 'Retry',
      'network_error': 'Network error. Please check your connection.',
      'symbol_not_found': 'Symbol not found',
    },
    'ko': {
      // Navigation
      'market': '시장',
      'settings': '설정',

      // Home page
      'search_coins': '코인 검색...',
      'no_coins_found': '코인을 찾을 수 없습니다',
      'scroll_for_more': '더 보려면 스크롤하세요...',

      // Sort header
      'symbol': '심볼',
      'price': '가격',
      'change_24h': '24시간 %',

      // Settings page
      'currency': '통화',
      'language': '언어',
      'exchange_rate': '환율',
      'refresh': '새로고침',
      'last_updated': '마지막 업데이트',
      'just_now': '방금 전',
      'minutes_ago': '{0}분 전',
      'hours_ago': '{0}시간 전',
      'days_ago': '{0}일 전',

      // Currency options
      'usd': '미국 달러',
      'krw': '한국 원',

      // Language options
      'english': '영어',
      'korean': '한국어',

      // Coin detail page
      'high_24h': '24시간 최고가',
      'low_24h': '24시간 최저가',
      'volume_24h': '24시간 거래량',
      'market_cap': '시가총액',
      'open_price': '시가',
      'circulating_supply': '유통량',
      'coming_soon': '준비중',

      // Chart
      '24h': '24시간',
      '7d': '7일',
      '1m': '1개월',

      // AI Insight
      'ai_insight': 'AI 분석',
      'buy_pressure': '매수 압력',
      'sell_pressure': '매도 압력',

      // News
      'related_articles': '관련 뉴스',

      // Errors
      'error_occurred': '오류가 발생했습니다',
      'retry': '다시 시도',
      'network_error': '네트워크 오류. 연결을 확인해주세요.',
      'symbol_not_found': '심볼을 찾을 수 없습니다',
    },
  };

  /// Get localized string by key
  String get(String key, {List<String>? params}) {
    var text = _localizedStrings[languageCode]?[key] ??
        _localizedStrings['en']?[key] ??
        key;

    // Replace placeholders {0}, {1}, etc.
    if (params != null) {
      for (var i = 0; i < params.length; i++) {
        text = text.replaceAll('{$i}', params[i]);
      }
    }

    return text;
  }

  /// Convenience getters for common strings
  String get market => get('market');
  String get settings => get('settings');
  String get searchCoins => get('search_coins');
  String get symbol => get('symbol');
  String get price => get('price');
  String get change24h => get('change_24h');
  String get currency => get('currency');
  String get language => get('language');
  String get exchangeRate => get('exchange_rate');
  String get refresh => get('refresh');
  String get usd => get('usd');
  String get krw => get('krw');
  String get english => get('english');
  String get korean => get('korean');
  String get retry => get('retry');
}
