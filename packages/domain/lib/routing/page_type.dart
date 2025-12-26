/// Application route types
///
/// This enum defines all possible navigation destinations in the app.
/// Each route has a path template and can carry parameters.
enum PageType {
  /// Splash screen - Initial loading screen
  /// Path: /splash
  splash('/splash'),

  /// Main screen with tabs (Home + Settings)
  /// Path: /main
  /// Optional query parameter: tab (0 for home, 1 for settings)
  main('/main'),

  /// Home tab within main screen
  /// This is a virtual route for tab navigation, not a GoRouter route
  home(''),

  /// Settings tab within main screen
  /// This is a virtual route for tab navigation, not a GoRouter route
  settings(''),

  /// Coin detail screen
  /// Path: /coin/:symbol
  /// Required path parameter: symbol (e.g., BTCUSDT)
  coinDetail('/coin/:symbol');

  const PageType(this.path);

  /// The path template for this route
  final String path;

  /// Build a complete path with parameters
  ///
  /// Usage:
  /// - PageType.splash.buildPath() => "/splash"
  /// - PageType.main.buildPath(queryParams: {'tab': '1'}) => "/main?tab=1"
  /// - PageType.coinDetail.buildPath(pathParams: {'symbol': 'BTCUSDT'}) => "/coin/BTCUSDT"
  String buildPath({
    Map<String, String>? pathParams,
    Map<String, String>? queryParams,
  }) {
    String result = path;

    // Replace path parameters (e.g., :symbol -> BTCUSDT)
    if (pathParams != null) {
      pathParams.forEach((key, value) {
        result = result.replaceAll(':$key', value);
      });
    }

    // Add query parameters
    if (queryParams != null && queryParams.isNotEmpty) {
      final query =
          queryParams.entries.map((e) => '${e.key}=${e.value}').join('&');
      result = '$result?$query';
    }

    return result;
  }

  /// Parse a path to determine the PageType
  ///
  /// This is used for deep link handling to determine which route was opened
  static PageType? fromPath(String path) {
    // Remove query parameters for matching
    final pathWithoutQuery = path.split('?').first;

    // Direct match first
    for (final pageType in PageType.values) {
      if (pageType.path == pathWithoutQuery) {
        return pageType;
      }
    }

    // Pattern matching for parameterized routes
    if (pathWithoutQuery.startsWith('/coin/')) {
      return PageType.coinDetail;
    }

    return null;
  }

  /// Extract parameters from a path
  ///
  /// Returns both path parameters and query parameters
  static RouteParams extractParams(String fullPath) {
    final uri = Uri.parse(fullPath);
    final pathWithoutQuery = uri.path;
    final queryParams = uri.queryParameters;

    final pathParams = <String, String>{};

    // Extract path parameters based on route pattern
    if (pathWithoutQuery.startsWith('/coin/')) {
      final symbol = pathWithoutQuery.substring('/coin/'.length);
      pathParams['symbol'] = symbol;
    }

    return RouteParams(
      pathParams: pathParams,
      queryParams: queryParams,
    );
  }
}

/// Container for route parameters
class RouteParams {
  final Map<String, String> pathParams;
  final Map<String, String> queryParams;

  const RouteParams({
    this.pathParams = const {},
    this.queryParams = const {},
  });

  /// Get a path parameter
  String? getPathParam(String key) => pathParams[key];

  /// Get a query parameter
  String? getQueryParam(String key) => queryParams[key];
}
