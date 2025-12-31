import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import flutter_svg
import '../constants/app_colors.dart';
import '../theme/app_typography.dart';

enum ButtonType { primary, secondary }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final ButtonType type;
  final IconData? icon;
  final String? svgPath;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.type = ButtonType.primary,
    this.icon,
    this.svgPath,
  });

  @override
  Widget build(BuildContext context) {
    final isPrimary = type == ButtonType.primary;
    final contentColor = isPrimary ? Colors.black : Colors.white;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
          color: isPrimary ? AppColors.whiteBtn : AppColors.cardSurface,
          borderRadius: BorderRadius.circular(12),
          border: isPrimary ? null : Border.all(color: AppColors.divider),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (svgPath != null) ...[
              SvgPicture.asset(
                svgPath!,
                height: 20,
                width: 20,
                colorFilter: ColorFilter.mode(contentColor, BlendMode.srcIn),
              ),
              const SizedBox(width: 8),
            ] else if (icon != null) ...[
              Icon(
                icon,
                color: contentColor,
                size: 20,
              ),
              const SizedBox(width: 8),
            ],

            Flexible(
              child: Text(
                text,
                style: AppTypography.buttonText.copyWith(
                  color: contentColor,
                  fontSize: 12,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}