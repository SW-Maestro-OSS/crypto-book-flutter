import 'package:flutter/material.dart';

/// Placeholder section for future chart implementation
class InsightSection extends StatelessWidget {
  const InsightSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.show_chart,
            size: 48,
            color: Color(0xFFBDBDBD),
          ),
          const SizedBox(height: 16),
          Text(
            '차트 준비중...',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '곧 가격 차트와 인사이트를 제공할 예정입니다',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[500],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
