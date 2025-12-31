import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class PnLHeader extends StatelessWidget {
  const PnLHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      color: AppColors.scaffoldBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Dropdown for Account Selection
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.cardSurface,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.divider),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("MT51i92", style: TextStyle(color: Colors.white)),
                const SizedBox(width: 8),
                const Icon(Icons.keyboard_arrow_down, color: Colors.grey, size: 16),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // The Grid of Stats
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _statItem("Floating pnl", "+\$200.00", AppColors.successGreen, isBig: true),
                    const SizedBox(height: 16),
                    _statItem("Margin :", "\$20.00", Colors.white),
                    const SizedBox(height: 16),
                    _statItem("Open positions :", "10", Colors.white),
                  ],
                ),
              ),
              // Vertical Divider
              Container(width: 1, height: 140, color: AppColors.divider),
              const SizedBox(width: 24),
              // Right Column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _statItem("Net realized pnl", "-\$200.00", AppColors.errorRed, alignRight: true),
                    const SizedBox(height: 16),
                    _statItem("Free margin", "\$20.00", Colors.white, alignRight: true),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statItem(String label, String value, Color valueColor, {bool isBig = false, bool alignRight = false}) {
    return Column(
      crossAxisAlignment: alignRight ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTypography.bodySmall),
        const SizedBox(height: 4),
        Text(
          value,
          style: isBig
              ? AppTypography.header.copyWith(fontSize: 28, color: valueColor)
              : AppTypography.titleLarge.copyWith(color: valueColor, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}