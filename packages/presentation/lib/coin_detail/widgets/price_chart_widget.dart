import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:domain/domain.dart';
import 'package:intl/intl.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';

/// Interactive price chart widget using fl_chart
class PriceChartWidget extends StatelessWidget {
  final ChartDataEntity? chartData;
  final ChartTimeframe selectedTimeframe;
  final Function(ChartTimeframe) onTimeframeChanged;
  final bool isLoading;

  const PriceChartWidget({
    super.key,
    this.chartData,
    required this.selectedTimeframe,
    required this.onTimeframeChanged,
    this.isLoading = false,
  });

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
                timeframe.label,
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
            'No chart data available',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChart() {
    if (chartData == null || chartData!.isEmpty) {
      return _buildEmptyChart();
    }

    final spots = chartData!.dataPoints.asMap().entries.map((entry) {
      return FlSpot(entry.key.toDouble(), entry.value.price);
    }).toList();

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
            horizontalInterval: chartData!.priceRange / 5,
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
                reservedSize: 50,
                interval: chartData!.priceRange / 4,
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
          minY: chartData!.minPrice * 0.999,
          maxY: chartData!.maxPrice * 1.001,
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
                  return LineTooltipItem(
                    '\$${dataPoint.price.toStringAsFixed(2)}\n${_formatTimestamp(dataPoint.timestamp)}',
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
    return Text(
      '\$${value.toStringAsFixed(0)}',
      style: AppTypography.bodySmall.copyWith(
        fontSize: 10,
      ),
    );
  }

  String _formatBottomLabel(DateTime timestamp) {
    switch (selectedTimeframe) {
      case ChartTimeframe.h24:
        return DateFormat('HH:mm').format(timestamp);
      case ChartTimeframe.d7:
        return DateFormat('MM/dd').format(timestamp);
      case ChartTimeframe.m1:
        return DateFormat('MM/dd').format(timestamp);
    }
  }

  String _formatTimestamp(DateTime timestamp) {
    switch (selectedTimeframe) {
      case ChartTimeframe.h24:
        return DateFormat('MMM dd HH:mm').format(timestamp);
      case ChartTimeframe.d7:
      case ChartTimeframe.m1:
        return DateFormat('MMM dd, yyyy').format(timestamp);
    }
  }
}
