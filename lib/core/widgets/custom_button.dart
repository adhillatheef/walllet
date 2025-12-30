import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../theme/app_typography.dart';

enum ButtonType { primary, secondary }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final ButtonType type;
  final IconData? icon;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.type = ButtonType.primary,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final isPrimary = type == ButtonType.primary;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(
          color: isPrimary ? AppColors.whiteBtn : AppColors.cardSurface,
          borderRadius: BorderRadius.circular(12),
          border: isPrimary ? null : Border.all(color: AppColors.divider),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(
                  icon,
                  color: isPrimary ? Colors.black : Colors.white,
                  size: 20
              ),
              const SizedBox(width: 8),
            ],
            Text(
              text,
              style: AppTypography.buttonText.copyWith(
                color: isPrimary ? Colors.black : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}