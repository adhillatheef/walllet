import 'package:flutter/material.dart';
import 'package:wallet/features/transfer/presentation/widgets/transfer_bottom_sheet.dart';
import 'package:wallet/features/wallet/presentation/widgets/deposit_bottom_sheet.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../../../core/widgets/custom_button.dart';

class WalletBalanceHeader extends StatelessWidget {
  const WalletBalanceHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Your Balance", style: AppTypography.bodyMedium),
          const SizedBox(height: 8),

          // Big Balance
          Text(
            CurrencyFormatter.format(5231.89),
            style: AppTypography.header.copyWith(fontSize: 40),
          ),

          // Unassigned Text
          Text(
            "Unassigned amount in wallet : \$345.09",
            style: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary, fontSize: 13),
          ),
          const SizedBox(height: 24),

          Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: "Deposit",
                  svgPath: "assets/icons/deposit.svg",
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true, // Important for full height
                      backgroundColor: Colors.transparent,
                      builder: (context) => Padding(
                        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: const DepositBottomSheet(),
                      ),
                    );
                  },
                  type: ButtonType.primary,
                ),
              ),
              const SizedBox(width: 8), // Reduced from 12 to 8 for better fit
              Expanded(
                child: CustomButton(
                  text: "Withdraw",
                  svgPath: "assets/icons/coins.svg",
                  onTap: () {},
                  type: ButtonType.secondary,
                ),
              ),
              const SizedBox(width: 8), // Reduced from 12 to 8
              Expanded(
                child: CustomButton(
                  text: "Transfer",
                  svgPath: "assets/icons/transfer.svg",
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true, // Important for full height
                      backgroundColor: Colors.transparent,
                      builder: (context) => Padding(
                        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: const TransferBottomSheet(),
                      ),
                    );
                  },
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