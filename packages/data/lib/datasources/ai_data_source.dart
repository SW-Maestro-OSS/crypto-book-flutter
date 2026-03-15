import 'dart:convert';
import 'dart:developer' as dev;
import 'package:domain/domain.dart';
import 'package:flutter_local_ai/flutter_local_ai.dart';

/// AI data source using on-device AI for coin analysis.
///
/// Uses flutter_local_ai for iOS (Apple Foundation Models),
/// Android (Gemini Nano), and Windows native AI APIs.
/// Falls back gracefully if the AI engine is not available on the device.
class AiDataSource {
  final FlutterLocalAi _aiEngine = FlutterLocalAi();
  bool _isAvailable = false;
  bool _isInitialized = false;
  Future<void>? _initFuture;

  static const _systemPrompt =
      'You are a cryptocurrency analyst. Analyze market data and news '
      'to provide buy/sell pressure analysis. Always respond with valid JSON only.';

  String? _unavailableReason;

  String? get unavailableReason => _unavailableReason;

  /// Wait for initialization to complete
  Future<void> ensureInitialized() async {
    if (_initFuture != null) await _initFuture;
  }

  Future<void> initialize() async {
    _initFuture = _doInitialize();
    await _initFuture;
  }

  Future<void> _doInitialize() async {
    try {
      dev.log('[AiDataSource] Calling isAvailable()...');
      _isAvailable = await _aiEngine.isAvailable();
      dev.log('[AiDataSource] isAvailable() returned: $_isAvailable');

      if (_isAvailable) {
        dev.log('[AiDataSource] Calling initialize(instructions:)...');
        await _aiEngine.initialize(instructions: _systemPrompt);
        _isInitialized = true;
        _unavailableReason = null;
        dev.log('[AiDataSource] AI engine initialized successfully');
      } else {
        _unavailableReason = 'isAvailable() returned false';
        dev.log('[AiDataSource] AI unavailable: $_unavailableReason');
      }
    } catch (e, st) {
      dev.log('[AiDataSource] AI initialization EXCEPTION: $e\n$st');
      _isAvailable = false;
      _isInitialized = false;
      _unavailableReason = 'Exception: $e';
    }
  }

  bool get isAvailable => _isAvailable;

  Future<AiInsightEntity> analyzeCoin({
    required CoinTickerEntity ticker,
    ChartDataEntity? chartData,
    List<NewsArticleEntity>? news,
    String languageCode = 'en',
  }) async {
    if (!_isAvailable || !_isInitialized) {
      throw const AiUnavailableError();
    }

    final prompt = _buildPrompt(ticker, chartData, news, languageCode);
    dev.log('[AiDataSource] Sending prompt: ${prompt.substring(0, 100)}...');

    try {
      final response = await _aiEngine.generateText(
        prompt: prompt,
        config: GenerationConfig(maxTokens: 500, temperature: 0.7),
      );

      dev.log(
        '[AiDataSource] Response received '
        '(${response.tokenCount} tokens, ${response.generationTimeMs}ms)',
      );

      return _parseResponse(response.text, ticker.baseAsset);
    } catch (e) {
      final errorStr = e.toString();
      // Android AICore not installed or outdated (error code -101)
      if (errorStr.contains('-101')) {
        _isAvailable = false;
        _unavailableReason = 'AICore needs to be updated. Opening Play Store...';
        try {
          await _aiEngine.openAICorePlayStore();
        } catch (_) {}
        throw const AiUnavailableError();
      }
      throw AiAnalysisError('AI generation failed: $errorStr');
    }
  }

  String _buildPrompt(
    CoinTickerEntity ticker,
    ChartDataEntity? chartData,
    List<NewsArticleEntity>? news,
    String languageCode,
  ) {
    final buffer = StringBuffer();
    buffer.writeln('Analyze the following cryptocurrency data and provide a JSON response.');
    buffer.writeln();
    buffer.writeln('## Ticker Data');
    buffer.writeln('Symbol: ${ticker.symbol}');
    buffer.writeln('Current Price: \$${ticker.currentPrice}');
    buffer.writeln('24h Change: ${ticker.priceChangePercent24h}%');
    buffer.writeln('24h High: \$${ticker.high24h}');
    buffer.writeln('24h Low: \$${ticker.low24h}');
    buffer.writeln('24h Volume: ${ticker.volume24h}');

    if (chartData != null && chartData.dataPoints.isNotEmpty) {
      buffer.writeln();
      buffer.writeln('## Chart Pattern');
      buffer.writeln('Timeframe: ${chartData.timeframe.label}');
      buffer.writeln('Price Range: \$${chartData.minPrice} - \$${chartData.maxPrice}');
      final first = chartData.dataPoints.first.price;
      final last = chartData.dataPoints.last.price;
      final trend = last > first ? 'Upward' : 'Downward';
      buffer.writeln('Trend: $trend (${((last - first) / first * 100).toStringAsFixed(2)}%)');
    }

    if (news != null && news.isNotEmpty) {
      buffer.writeln();
      buffer.writeln('## Recent News Headlines');
      for (final article in news) {
        buffer.writeln('- ${article.title} (${article.source})');
      }
    }

    final insightLang = languageCode == 'ko'
        ? 'Write all insight strings in Korean (한국어).'
        : 'Write all insight strings in English.';

    buffer.writeln();
    buffer.writeln('Respond ONLY with a JSON object:');
    buffer.writeln('{');
    buffer.writeln('  "buyPressure": <float 0.0-1.0>,');
    buffer.writeln('  "sellPressure": <float 0.0-1.0>,');
    buffer.writeln('  "insights": ["<insight1>", "<insight2>", "<insight3>", "<insight4>"]');
    buffer.writeln('}');
    buffer.writeln();
    buffer.writeln(insightLang);

    return buffer.toString();
  }

  AiInsightEntity _parseResponse(String response, String symbol) {
    try {
      // Extract JSON from response (may have surrounding text)
      final jsonStart = response.indexOf('{');
      final jsonEnd = response.lastIndexOf('}');
      if (jsonStart == -1 || jsonEnd == -1) {
        throw const FormatException('No JSON found in response');
      }

      final jsonStr = response.substring(jsonStart, jsonEnd + 1);
      final json = jsonDecode(jsonStr) as Map<String, dynamic>;

      final buyPressure = (json['buyPressure'] as num?)?.toDouble() ?? 0.5;
      final sellPressure = (json['sellPressure'] as num?)?.toDouble() ?? 0.5;
      final insights = (json['insights'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          ['Analysis completed'];

      return AiInsightEntity(
        symbol: symbol,
        insights: insights,
        buyPressure: buyPressure.clamp(0.0, 1.0),
        sellPressure: sellPressure.clamp(0.0, 1.0),
        generatedAt: DateTime.now(),
      );
    } catch (e) {
      dev.log('[AiDataSource] Failed to parse AI response: $e');
      throw AiAnalysisError('Failed to parse AI response: $e');
    }
  }
}
