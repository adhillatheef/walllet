import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class DepositBottomSheet extends StatelessWidget {
  const DepositBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: const BoxDecoration(
        color: AppColors.cardSurface, // #1E1E1E approx
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 1. Handle Bar
          Container(
            width: 32,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),

          // 2. Success Icon & Title
          Image.asset(
            'assets/images/success_check.png', // Ensure you renamed the asset
            height: 80,
            width: 80,
          ),
          const SizedBox(height: 16),
          Text(
            "Wallet Deposit",
            style: AppTypography.titleLarge.copyWith(fontSize: 20),
          ),
          const SizedBox(height: 32),

          // 3. "To" Section (Separate Card)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF0B0B0B), // Darker inner bg
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("To", style: AppTypography.bodySmall.copyWith(color: Colors.grey)),
                Expanded(
                  child: Text(
                    "Wallet (HDFC - 5375 **** **** 8544)",
                    textAlign: TextAlign.right,
                    style: AppTypography.bodyMedium.copyWith(color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // 4. Detailed Transaction Info (Larger Card)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF0B0B0B),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                _buildRow("From", "Axis Bank - 5375 **** **** 2368"),
                const SizedBox(height: 16),
                _buildRow("Txn Id", "TXN-9F7A2C1E-20250919-847362"),
                const SizedBox(height: 16),
                _buildRow("Note", "Investment funding"),
                const SizedBox(height: 16),
                _buildRow("Status", "Completed"),
                const SizedBox(height: 16),
                _buildRow("Time and Date", "29-4-24, 6:45 PM"),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // 5. Total Amount Section
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Total", style: AppTypography.bodySmall.copyWith(color: Colors.grey)),
          ),
          const SizedBox(height: 4),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "\$199.00",
              style: AppTypography.header.copyWith(fontSize: 36),
            ),
          ),
          const SizedBox(height: 32),

          // 6. Continue Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close sheet
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text(
                "Continue",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.bodySmall.copyWith(color: Colors.grey),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: AppTypography.bodyMedium.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}