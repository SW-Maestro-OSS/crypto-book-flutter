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
      'minutes_ago': '{0}m ago',
      'hours_ago': '{0}h ago',
      'days_ago': '{0}d ago',

      // Currency options
      'usd': 'US Dollar',
      'krw': 'Korean Won',
      'dollar': 'Dollar',
      'won': 'Won',

      // Language options
      'english': 'English',
      'korean': 'Korean',

      // Coin detail page
      'high_24h': '24h High',
      'low_24h': '24h Low',
      'volume_24h': '24h Volume',
      'quote_volume': 'Quote Volume',
      'market_cap': 'Market Cap',
      'open_price': 'Open Price',
      'circulating_supply': 'Circulating Supply',
      'coming_soon': 'Coming soon',
      'na': 'N/A',

      // Chart
      '24h': '24H',
      '7d': '7D',
      '1m': '1M',
      'no_chart_data': 'No chart data available',

      // AI Insight
      'ai_insight': 'AI Insight',
      'ai_prompt': 'Get AI-powered analysis for this coin',
      'analyze': 'Analyze',
      'analyzing': 'Analyzing...',
      'market_pressure': 'Market Pressure',
      'buy': 'Buy',
      'sell': 'Sell',
      'buy_pressure': 'Buy Pressure',
      'sell_pressure': 'Sell Pressure',
      'ai_unavailable': 'AI analysis is not available on this device',
      'analysis_failed': 'Analysis failed',

      // News
      'related_articles': 'Related Articles',
      'no_articles': 'No articles available',

      // Errors
      'error_occurred': 'An error occurred',
      'retry': 'Retry',
      'network_error': 'Network error. Please check your connection.',
      'symbol_not_found': 'Symbol not found',
      'try_again_later': 'Please try again later',
      'check_connection': 'Please check your connection and try again',
      'network_unstable': 'Network is unstable. Please try again',
      'info_not_found': 'The requested information was not found',
      'press_retry': 'Press the button below to retry',

      // General
      'loading': 'Loading...',
      'never': 'Never',
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
      'dollar': '달러',
      'won': '원',

      // Language options
      'english': '영어',
      'korean': '한국어',

      // Coin detail page
      'high_24h': '24시간 최고가',
      'low_24h': '24시간 최저가',
      'volume_24h': '24시간 거래량',
      'quote_volume': '견적 거래량',
      'market_cap': '시가총액',
      'open_price': '시가',
      'circulating_supply': '유통량',
      'coming_soon': '준비중',
      'na': 'N/A',

      // Chart
      '24h': '24시간',
      '7d': '7일',
      '1m': '1개월',
      'no_chart_data': '차트 데이터가 없습니다',

      // AI Insight
      'ai_insight': 'AI 분석',
      'ai_prompt': '이 코인의 AI 분석을 받아보세요',
      'analyze': '분석하기',
      'analyzing': '분석 중...',
      'market_pressure': '시장 압력',
      'buy': '매수',
      'sell': '매도',
      'buy_pressure': '매수 압력',
      'sell_pressure': '매도 압력',
      'ai_unavailable': '이 기기에서는 AI 분석을 사용할 수 없습니다',
      'analysis_failed': '분석 실패',

      // News
      'related_articles': '관련 뉴스',
      'no_articles': '기사가 없습니다',

      // Errors
      'error_occurred': '오류가 발생했습니다',
      'retry': '다시 시도',
      'network_error': '네트워크 오류. 연결을 확인해주세요.',
      'symbol_not_found': '심볼을 찾을 수 없습니다',
      'try_again_later': '잠시 후 다시 시도해주세요',
      'check_connection': '인터넷 연결 상태를 확인하고 다시 시도해주세요',
      'network_unstable': '네트워크가 불안정합니다. 다시 시도해주세요',
      'info_not_found': '요청하신 정보를 찾을 수 없습니다',
      'press_retry': '아래 버튼을 눌러 다시 시도해주세요',

      // General
      'loading': '로딩 중...',
      'never': '없음',
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
  String get noCoinsFound => get('no_coins_found');
  String get scrollForMore => get('scroll_for_more');
  String get symbol => get('symbol');
  String get price => get('price');
  String get change24h => get('change_24h');
  String get currency => get('currency');
  String get language => get('language');
  String get exchangeRate => get('exchange_rate');
  String get refresh => get('refresh');
  String get lastUpdated => get('last_updated');
  String get dollar => get('dollar');
  String get won => get('won');
  String get usd => get('usd');
  String get krw => get('krw');
  String get english => get('english');
  String get korean => get('korean');
  String get high24h => get('high_24h');
  String get low24h => get('low_24h');
  String get volume24h => get('volume_24h');
  String get quoteVolume => get('quote_volume');
  String get marketCap => get('market_cap');
  String get circulatingSupply => get('circulating_supply');
  String get comingSoon => get('coming_soon');
  String get na => get('na');
  String get noChartData => get('no_chart_data');
  String get aiInsight => get('ai_insight');
  String get aiPrompt => get('ai_prompt');
  String get analyze => get('analyze');
  String get analyzing => get('analyzing');
  String get marketPressure => get('market_pressure');
  String get buy => get('buy');
  String get sell => get('sell');
  String get buyPressure => get('buy_pressure');
  String get sellPressure => get('sell_pressure');
  String get aiUnavailable => get('ai_unavailable');
  String get analysisFailed => get('analysis_failed');
  String get relatedArticles => get('related_articles');
  String get noArticles => get('no_articles');
  String get errorOccurred => get('error_occurred');
  String get retry => get('retry');
  String get tryAgainLater => get('try_again_later');
  String get checkConnection => get('check_connection');
  String get networkUnstable => get('network_unstable');
  String get infoNotFound => get('info_not_found');
  String get pressRetry => get('press_retry');
  String get loading => get('loading');
  String get never => get('never');
}
