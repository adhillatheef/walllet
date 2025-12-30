import 'package:flutter/material.dart';
import 'package:wallet/features/home/presentation/widgets/live_ticker_widget.dart';
import '../../../../core/constants/app_colors.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/balance_section.dart';
import '../widgets/section_header.dart';
import '../widgets/info_card.dart';
import '../widgets/transaction_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Basic bottom padding to ensure content isn't hidden behind the floating nav bar
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 100), // Space for BottomNav
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Header
              const DashboardHeader(),

              // 2. Main Balance
              const BalanceSection(),

              // 3. The "Wow" Factor: Live Ticker
              const LiveTickerWidget(),
              const SizedBox(height: 16),

              // 4. MT5 Accounts (Horizontal Scroll)
              const SectionHeader(title: "My MT5 Accounts"),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: const [
                    InfoCard(
                      title: "Demo",
                      subtitle: "MT51192",
                      amountOrNumber: "+\$5,325.57",
                      backgroundColor: AppColors.cardSurface,
                    ),
                    InfoCard(
                      title: "Live",
                      subtitle: "MT51192",
                      amountOrNumber: "+\$5,325.57",
                      backgroundColor: AppColors.cardSurface,
                      isLive: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // 5. Bank Accounts (Horizontal Scroll)
              const SectionHeader(title: "My Bank Accounts"),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: const [
                    InfoCard(
                      title: "Axis Bank",
                      subtitle: "5375 **** **** 2368",
                      amountOrNumber: "India",
                      backgroundColor: AppColors.successGreen,
                    ),
                    InfoCard(
                      title: "ICICI",
                      subtitle: "5375 **** **** 2368",
                      amountOrNumber: "India",
                      backgroundColor: Color(0xFF4285F4), // specific blue
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // 6. Transactions Overview
              const SectionHeader(title: "Total Transactions Overview"),

              // Dummy Data Mapping
              const TransactionTile(
                title: "Wallet deposit",
                date: "23rd May 2025",
                amount: "+\$21,282",
                status: "Approved",
                icon: Icons.account_balance_wallet,
                iconColor: AppColors.successGreen,
              ),
              const TransactionTile(
                title: "Wallet Withdraw",
                date: "23rd May 2025",
                amount: "-\$21,282",
                status: "Approved",
                icon: Icons.outbox,
                iconColor: AppColors.errorRed,
              ),
              const TransactionTile(
                title: "Referral",
                date: "23rd May 2025",
                amount: "+\$21,282",
                status: "Approved",
                icon: Icons.loop,
                iconColor: AppColors.primaryPurple,
              ),
              const TransactionTile(
                title: "Wallet deposit",
                date: "23rd May 2025",
                amount: "+\$21,282",
                status: "Rejected",
                icon: Icons.account_balance_wallet,
                iconColor: AppColors.successGreen,
              ),
            ],
          ),
        ),
      ),
    );
  }
}