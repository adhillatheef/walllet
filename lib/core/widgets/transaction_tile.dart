import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../theme/app_typography.dart';

class TransactionTile extends StatelessWidget {
  final String title;
  final String date;
  final String amount;
  final String status; // Approved, Rejected
  final IconData icon;
  final Color iconColor;

  const TransactionTile({
    super.key,
    required this.title,
    required this.date,
    required this.amount,
    required this.status,
    required this.icon,
    this.iconColor = AppColors.primaryPurple,
  });

  @override
  Widget build(BuildContext context) {
    final isPositive = amount.startsWith('+');
    final statusColor = status == "Rejected" ? AppColors.errorRed : AppColors.textSecondary;

    return Container(
      margin: const EdgeInsets.only(bottom: 12, left: 12, right: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardSurface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTypography.bodyMedium.copyWith(color: Colors.white)),
                const SizedBox(height: 4),
                Text(date, style: AppTypography.bodySmall),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: AppTypography.bodyMedium.copyWith(
                  color: isPositive ? AppColors.successGreen : Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                status,
                style: AppTypography.bodySmall.copyWith(color: statusColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}