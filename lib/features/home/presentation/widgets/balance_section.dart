import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../../../core/widgets/custom_button.dart'; // The button we made earlier

class BalanceSection extends StatelessWidget {
  const BalanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Your Balance", style: AppTypography.bodyMedium),
          const SizedBox(height: 8),
          Text(
            CurrencyFormatter.format(5231.89), // Hardcoded for UI demo
            style: AppTypography.header.copyWith(fontSize: 36),
          ),
          const SizedBox(height: 8),
          Text(
            "Unassigned amount in wallet : \$345.09",
            style: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(height: 24),

          // Action Buttons Row
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: "Deposit",
                  icon: Icons.account_balance_wallet_outlined,
                  onTap: () {},
                  type: ButtonType.primary,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: CustomButton(
                  text: "Withdraw",
                  icon: Icons.payments_outlined,
                  onTap: () {},
                  type: ButtonType.secondary,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: CustomButton(
                  text: "Transfer",
                  icon: Icons.send_outlined,
                  onTap: () {},
                  type: ButtonType.secondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}