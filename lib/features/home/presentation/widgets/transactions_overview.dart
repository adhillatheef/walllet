import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class TransactionsOverview extends StatelessWidget {
  const TransactionsOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.cardSurface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.12), width: 1)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Total Transactions Overview", style: AppTypography.titleMedium),
            const SizedBox(height: 12),

            // The Big Chart Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.cardSurface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white.withOpacity(0.12), width: 1),
              ),
              child: Row(
                children: [
                  // Left Side: Amount
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Toggle Buttons
                        Row(
                          children: ["W", "M", "Y"].map((e) => Container(
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                                color: e == "M" ? Colors.white.withOpacity(0.1) : Colors.transparent,
                                borderRadius: BorderRadius.circular(8)
                            ),
                            child: Text(e, style: AppTypography.bodySmall),
                          )).toList(),
                        ),
                        const SizedBox(height: 20),
                        Text("Transactions(1M)", style: AppTypography.bodySmall),
                        const SizedBox(height: 4),
                        Text("\$556.89", style: AppTypography.header.copyWith(fontSize: 28)),
                      ],
                    ),
                  ),
                  // Right Side: Bar Chart
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 100,
                      child: BarChart(
                        BarChartData(
                          gridData: const FlGridData(show: false),
                          titlesData: const FlTitlesData(show: false),
                          borderData: FlBorderData(show: false),
                          barGroups: [
                            _makeGroup(0, 5, Colors.white),
                            _makeGroup(1, 8, Colors.white),
                            _makeGroup(2, 6, Colors.white),
                            _makeGroup(3, 4, Colors.white),
                            _makeGroup(4, 7, Colors.white),
                            _makeGroup(5, 9, Colors.white),
                            _makeGroup(6, 6, AppColors.successGreen),
                            _makeGroup(7, 8, AppColors.primaryPurple),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Two Small Cards Row
            Row(
              children: [
                _buildSmallCard(
                    "Referral",
                    "+\$105.89",
                    Icons.supervised_user_circle,
                    AppColors.primaryPurple
                ),
                const SizedBox(width: 12),
                _buildSmallCard(
                    "Bonus",
                    "+\$56.89",
                    Icons.diamond_outlined,
                    AppColors.successGreen
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSmallCard(String title, String amount, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.cardSurface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.divider),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: Colors.white, size: 20),
            ),
            const SizedBox(height: 12),
            Text(title, style: AppTypography.bodySmall.copyWith(color: color)),
            const SizedBox(height: 4),
            Text(amount, style: AppTypography.titleLarge),
          ],
        ),
      ),
    );
  }

  BarChartGroupData _makeGroup(int x, double y, Color color) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: color,
          width: 12,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    );
  }
}