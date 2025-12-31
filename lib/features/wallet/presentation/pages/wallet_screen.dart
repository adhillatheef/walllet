import 'package:flutter/material.dart';
import 'package:wallet/core/widgets/dashboard_header.dart';
import 'package:wallet/core/widgets/info_card.dart';
import 'package:wallet/core/widgets/section_header.dart';
import 'package:wallet/core/widgets/transaction_tile.dart';
import 'package:wallet/features/wallet/presentation/pages/all_transactions_screen.dart';
import '../../../../core/constants/app_colors.dart';
import '../widgets/wallet_balance_header.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Header & Balance
              const DashboardHeader(),
              const WalletBalanceHeader(),

              // 2. COMBINED ACCOUNTS SECTION
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                padding: const EdgeInsets.only(bottom: 24),
                decoration: BoxDecoration(
                  color: AppColors.cardSurface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.divider),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // -- MT5 Accounts --
                    const SectionHeader(title: "My MT5 Accounts"),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: const [
                          InfoCard(
                            title: "Demo",
                            subtitle: "MT51192",
                            amountOrNumber: "+\$5,325.57",
                            backgroundColor: AppColors.cardSurface, // Slightly darker to pop against card surface
                            subtitleColor: Color(0xff7C5DE1),
                          ),
                          InfoCard(
                            title: "Live",
                            subtitle: "MT51192",
                            amountOrNumber: "+\$5,325.57",
                            backgroundColor: AppColors.cardSurface,
                            subtitleColor: Color(0xff7C5DE1),
                            isLive: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // -- Bank Accounts --
                    const SectionHeader(title: "My Bank Accounts"),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: const [
                          InfoCard(
                            title: "Axis Bank",
                            subtitle: "5375 **** **** 2368",
                            amountOrNumber: "India",
                            backgroundColor: AppColors.successGreen,
                            titleColor: AppColors.whiteBtn,
                            subtitleColor: AppColors.whiteBtn,
                            amountOrNumberColor: AppColors.whiteBtn,
                            amountOrNumberFontSize: 10,
                          ),
                          InfoCard(
                            title: "ICICI",
                            subtitle: "5375 **** **** 2368",
                            amountOrNumber: "India",
                            backgroundColor: Color(0xFF4285F4),
                            titleColor: AppColors.whiteBtn,
                            subtitleColor: AppColors.whiteBtn,
                            amountOrNumberColor: AppColors.whiteBtn,
                            amountOrNumberFontSize: 10,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // -- Crypto Address --
                    const SectionHeader(title: "My Crypto Address"),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: const [
                          InfoCard(
                            title: "TRC20",
                            subtitle: "",
                            amountOrNumber: "TQ9aC9...Lx3p9z",
                            backgroundColor: AppColors.cardSurface,
                          ),
                          InfoCard(
                            title: "TRC20",
                            subtitle: "",
                            amountOrNumber: "0x4e9c...d28a67",
                            backgroundColor: AppColors.cardSurface,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // 3. TOTAL TRANSACTIONS SECTION (Bordered)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.cardSurface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.divider),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    SectionHeader(title: "Total Transactions Overview"),

                    TransactionTile(
                      title: "Wallet deposit",
                      date: "23rd May 2025",
                      amount: "+\$21,282",
                      status: "Approved",
                      icon: Icons.account_balance_wallet,
                      iconColor: AppColors.successGreen,
                    ),
                    TransactionTile(
                      title: "Wallet Withdraw",
                      date: "23rd May 2025",
                      amount: "-\$21,282",
                      status: "Approved",
                      icon: Icons.outbox,
                      iconColor: AppColors.errorRed,
                    ),
                    TransactionTile(
                      title: "Referral",
                      date: "23rd May 2025",
                      amount: "+\$21,282",
                      status: "Approved",
                      icon: Icons.loop,
                      iconColor: AppColors.primaryPurple,
                    ),
                    TransactionTile(
                      title: "Bonus",
                      date: "23rd May 2025",
                      amount: "+\$21,282",
                      status: "Approved",
                      icon: Icons.diamond_outlined,
                      iconColor: AppColors.warningOrange,
                    ),
                    TransactionTile(
                      title: "Wallet deposit",
                      date: "23rd May 2025",
                      amount: "+\$21,282",
                      status: "Rejected",
                      icon: Icons.account_balance_wallet,
                      iconColor: AppColors.successGreen,
                    ),
                    const SizedBox(height: 16),

                    // View All Button
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 24),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const AllTransactionsScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          child: const Text("View All", style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}