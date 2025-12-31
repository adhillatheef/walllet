import 'package:flutter/material.dart';
import '../../../../core/theme/app_typography.dart';

class TipsCarousel extends StatelessWidget {
  const TipsCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.9),
        itemCount: 1,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF171717), // #171717 21.35%
                  Color(0xFF1DFFAA), // #1DFFAA 210.76% (Teal Green)
                ],
                stops: [0.21, 2.1], // Adjusting stops based on your deg approximation
                transform: GradientRotation(212.5 * 3.14 / 180), // rotation
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Always use a stop-loss. It protects your capital and prevents small losses from turning into account blowouts.",
                  textAlign: TextAlign.center,
                  style: AppTypography.titleMedium.copyWith(height: 1.5),
                ),
                const SizedBox(height: 24),
                Text("Trading Tips", style: AppTypography.bodySmall.copyWith(color: Colors.white54)),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _dot(true),
                    _dot(false),
                    _dot(false),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _dot(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white24,
        shape: BoxShape.circle,
      ),
    );
  }
}