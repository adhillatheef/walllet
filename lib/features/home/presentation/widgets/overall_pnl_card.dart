import 'package:flutter/material.dart';
import 'package:wallet/features/investments/presentation/pages/investment_pnl_screen.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class OverallPnLCard extends StatelessWidget {
  const OverallPnLCard({super.key});

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
            Text("Overall P/L", style: AppTypography.titleMedium),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.cardSurface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.divider),
              ),
              child: Column(
                children: [
                  // Header Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _headerItem("MT51192", "MT5 ID", isBold: true),
                      _headerItem("+\$200.00", "Floating pnl", color: AppColors.successGreen, isBold: true),
                      _headerItem("22", "Open position", isBold: true),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Position 1
                  _positionRow(
                      "USDXAU", "Buy", "+\$244.00", AppColors.successGreen
                  ),
                  const SizedBox(height: 12),

                  // Position 2
                  _positionRow(
                      "USDXAU", "Sell", "-\$244.00", AppColors.errorRed
                  ),

                  const SizedBox(height: 16),
                  // View All Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const InvestmentPnLScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text("View All", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _headerItem(String top, String bottom, {Color? color, bool isBold = false}) {
    return Column(
      children: [
        Text(top, style: AppTypography.titleMedium.copyWith(
            color: color ?? Colors.white,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal
        )),
        Text(bottom, style: AppTypography.bodySmall),
      ],
    );
  }

  Widget _positionRow(String symbol, String type, String amount, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4)
                ),
                child: Text(type, style: const TextStyle(fontSize: 10, color: Colors.white)),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(symbol, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  const Text("SL: \$14.00  TP: +\$44.00", style: TextStyle(color: Colors.grey, fontSize: 10)),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(amount, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 16)),
              const Text("\$10.00 x 2.47 lots", style: TextStyle(color: Colors.grey, fontSize: 10)),
            ],
          ),
        ],
      ),
    );
  }
}