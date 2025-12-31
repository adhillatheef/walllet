import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../theme/app_typography.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amountOrNumber;
  final Color backgroundColor;
  final Color? subtitleColor;
  final bool isLive;
  final Color? titleColor;
  final Color? amountOrNumberColor;
  final double? amountOrNumberFontSize;

  const InfoCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.amountOrNumber,
    this.backgroundColor = AppColors.cardSurface,
    this.subtitleColor,
    this.isLive = false,
    this.titleColor,
    this.amountOrNumberColor,
    this.amountOrNumberFontSize,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveTitleColor = titleColor ??
        (backgroundColor == AppColors.cardSurface ? Colors.white : Colors.black87);

    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: backgroundColor == AppColors.cardSurface
            ? Border.all(color: AppColors.divider)
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                  title,
                  style: AppTypography.bodyMedium.copyWith(
                      color: effectiveTitleColor,
                      fontWeight: FontWeight.bold
                  )
              ),
              if (isLive) ...[
                const SizedBox(width: 4),
                Container(width: 6, height: 6, decoration: const BoxDecoration(color: AppColors.successGreen, shape: BoxShape.circle))
              ]
            ],
          ),
          const SizedBox(height: 4),
          Text(
              subtitle,
              style: AppTypography.bodySmall.copyWith(
                  color: subtitleColor ?? (backgroundColor == AppColors.cardSurface ? Colors.grey : Colors.black54)
              )
          ),
          const SizedBox(height: 16),
          Text(
            amountOrNumber,
            style: AppTypography.titleMedium.copyWith(
                color: amountOrNumberColor ?? (backgroundColor == AppColors.cardSurface ? Colors.grey : Colors.black54),
              fontSize: amountOrNumberFontSize,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}