import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/dashboard_header.dart';
import '../widgets/running_promo_bar.dart';
import '../widgets/balance_section.dart';
import '../widgets/promo_banner.dart';
import '../widgets/transactions_overview.dart';
import '../widgets/overall_pnl_card.dart';
import '../widgets/tips_carousel.dart';
import '../widgets/education_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 120), // Space for bottom nav
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Header (Avatar + Logo)
              const DashboardHeader(),

              // 2. Running Green Bar
              const RunningPromoBar(),

              // 3. Balance + Deposit/Withdraw Buttons
              const BalanceSection(),

              // 4. "Ring in New Year" Banner
              const PromoBanner(),

              // 5. Transaction Overview (Chart + Cards)
              const TransactionsOverview(),

              // 6. Overall P/L Card
              const OverallPnLCard(),

              // 7. Trading Tips Carousel
              const SizedBox(height: 12),
              const TipsCarousel(),

              // 8. Education Card
              const EducationCard(),
            ],
          ),
        ),
      ),
    );
  }
}