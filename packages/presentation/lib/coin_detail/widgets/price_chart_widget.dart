import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:domain/domain.dart';
import 'package:intl/intl.dart';
import 'package:domain/entities/exchange_rate_entity.dart';
import 'package:presentation/core/l10n/app_strings.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import '../../core/utils/date_formatter.dart';

/// Interactive price chart widget using fl_chart
class PriceChartWidget extends StatelessWidget {
  final ChartDataEntity? chartData;
  final ChartTimeframe selectedTimeframe;
  final Function(ChartTimeframe) onTimeframeChanged;
  final bool isLoading;
  final AppStrings strings;
  final String currency;
  final ExchangeRateEntity? exchangeRate;

  const PriceChartWidget({
    super.key,
    this.chartData,
    required this.selectedTimeframe,
    required this.onTimeframeChanged,
    this.isLoading = false,
    required this.strings,
    this.currency = 'USD',
    this.exchangeRate,
  });

  String _localizedTimeframeLabel(ChartTimeframe timeframe) {
    switch (timeframe) {
      case ChartTimeframe.h24:
        return strings.get('24h');
      case ChartTimeframe.d7:
        return strings.get('7d');
      case ChartTimeframe.m1:
        return strings.get('1m');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeframe selector tabs
        _buildTimeframeTabs(),
        const SizedBox(height: AppSpacing.lg),

        // Chart
        SizedBox(
          height: AppSpacing.chartHeight,
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : chartData == null || chartData!.isEmpty
                  ? _buildEmptyChart()
                  : _buildChart(),
        ),
      ],
    );
  }

  Widget _buildTimeframeTabs() {
    return Row(
      children: ChartTimeframe.values.map((timeframe) {
        final isSelected = selectedTimeframe == timeframe;
        return Expanded(
          child: InkWell(
            onTap: () => onTimeframeChanged(timeframe),
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: AppSpacing.sm,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: isSelected ? AppColors.primary : Colors.transparent,
                    width: 2,
                  ),
                ),
              ),
              child: Text(
                _localizedTimeframeLabel(timeframe),
                textAlign: TextAlign.center,
                style: AppTypography.labelLarge.copyWith(
                  color: isSelected ? AppColors.primary : AppColors.textSecondary,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildEmptyChart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.show_chart,
            size: AppSpacing.iconXl * 1.5,
            color: AppColors.textTertiary,
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            strings.noChartData,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  double get _rateMultiplier {
    if (currency == 'KRW' && exchangeRate != null) {
      return exchangeRate!.rate;
    }
    return 1.0;
  }

  Widget _buildChart() {
    if (chartData == null || chartData!.isEmpty) {
      return _buildEmptyChart();
    }

    final multiplier = _rateMultiplier;
    final spots = chartData!.dataPoints.asMap().entries.map((entry) {
      return FlSpot(entry.key.toDouble(), entry.value.price * multiplier);
    }).toList();

    final minPrice = chartData!.minPrice * multiplier;
    final maxPrice = chartData!.maxPrice * multiplier;
    final priceRange = chartData!.priceRange * multiplier;
    final reservedSize = currency == 'KRW' ? 80.0 : 50.0;

    return Padding(
      padding: const EdgeInsets.only(
        right: AppSpacing.lg,
        top: AppSpacing.md,
        bottom: AppSpacing.md,
      ),
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: priceRange / 5,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: AppColors.chartGrid,
                strokeWidth: 1,
              );
            },
          ),
          titlesData: FlTitlesData(
            show: true,
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                interval: _getBottomInterval(),
                getTitlesWidget: _getBottomTitles,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: reservedSize,
                interval: priceRange / 4,
                getTitlesWidget: _getLeftTitles,
              ),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: AppColors.border),
          ),
          minX: 0,
          maxX: (chartData!.dataPoints.length - 1).toDouble(),
          minY: minPrice * 0.999,
          maxY: maxPrice * 1.001,
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              color: AppColors.chartLine,
              barWidth: 2,
              isStrokeCapRound: true,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                color: AppColors.chartLine.withValues(alpha: 0.1),
              ),
            ),
          ],
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              getTooltipColor: (touchedSpot) => AppColors.textPrimary,
              tooltipRoundedRadius: 8,
              getTooltipItems: (touchedSpots) {
                return touchedSpots.map((spot) {
                  final dataPoint = chartData!.dataPoints[spot.x.toInt()];
                  final price = dataPoint.price * _rateMultiplier;
                  final String formattedPrice;
                  if (currency == 'KRW') {
                    final formatter = NumberFormat('#,###', 'ko_KR');
                    formattedPrice = '₩${formatter.format(price.toInt())}';
                  } else {
                    formattedPrice = '\$${price.toStringAsFixed(2)}';
                  }
                  return LineTooltipItem(
                    '$formattedPrice\n${_formatTimestamp(dataPoint.timestamp)}',
                    const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }).toList();
              },
            ),
          ),
        ),
      ),
    );
  }

  double _getBottomInterval() {
    if (chartData == null || chartData!.isEmpty) return 1;
    final count = chartData!.length;
    if (count <= 10) return 1;
    if (count <= 20) return 2;
    if (count <= 30) return 5;
    return 10;
  }

  Widget _getBottomTitles(double value, TitleMeta meta) {
    if (chartData == null || value.toInt() >= chartData!.length) {
      return const SizedBox.shrink();
    }

    final dataPoint = chartData!.dataPoints[value.toInt()];
    final text = _formatBottomLabel(dataPoint.timestamp);

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        text,
        style: AppTypography.bodySmall.copyWith(
          fontSize: 10,
        ),
      ),
    );
  }

  Widget _getLeftTitles(double value, TitleMeta meta) {
    final String formattedPrice;
    if (currency == 'KRW') {
      final formatter = NumberFormat('#,###', 'ko_KR');
      formattedPrice = '₩${formatter.format(value.toInt())}';
    } else {
      final decimals = value >= 1000 ? 0 : value >= 1 ? 2 : 4;
      formattedPrice = '\$${value.toStringAsFixed(decimals)}';
    }
    return Text(
      formattedPrice,
      style: AppTypography.bodySmall.copyWith(
        fontSize: 10,
      ),
    );
  }

  String _formatBottomLabel(DateTime timestamp) {
    return DateFormatter.formatChartLabel(timestamp, selectedTimeframe);
  }

  String _formatTimestamp(DateTime timestamp) {
    return DateFormatter.formatChartTimestamp(timestamp, selectedTimeframe);
  }
}
