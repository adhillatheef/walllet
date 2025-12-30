import 'package:flutter/material.dart';
import '../../../../core/theme/app_typography.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTypography.titleMedium),
          const Icon(Icons.more_horiz, color: Colors.grey),
        ],
      ),
    );
  }
}