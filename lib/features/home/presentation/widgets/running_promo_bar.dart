import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class RunningPromoBar extends StatefulWidget {
  const RunningPromoBar({super.key});

  @override
  State<RunningPromoBar> createState() => _RunningPromoBarState();
}

class _RunningPromoBarState extends State<RunningPromoBar> with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    // Simple auto-scroll trigger
    WidgetsBinding.instance.addPostFrameCallback((_) => _startScrolling());
  }

  void _startScrolling() async {
    while (_scrollController.hasClients) {
      await Future.delayed(const Duration(milliseconds: 50));
      if (_scrollController.hasClients) {
        if (_scrollController.offset >= _scrollController.position.maxScrollExtent) {
          _scrollController.jumpTo(0);
        } else {
          _scrollController.animateTo(
              _scrollController.offset + 2,
              duration: const Duration(milliseconds: 50),
              curve: Curves.linear
          );
        }
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      color: AppColors.successGreen,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          // Repeating content
          return Row(
            children: [
              const SizedBox(width: 16),
              Text("Withdrawals", style: AppTypography.bodyMedium.copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
              const SizedBox(width: 8),
              const Icon(Icons.lock, color: Colors.black54, size: 16),
              const SizedBox(width: 8),
              Text("Secure Trading Wallet", style: AppTypography.bodyMedium.copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
              const SizedBox(width: 8),
              const Icon(Icons.bolt, color: Colors.yellow, size: 18),
              const SizedBox(width: 8),
              Text("Instant Deposits", style: AppTypography.bodyMedium.copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
              const SizedBox(width: 8),
              const Icon(Icons.money, color: Colors.white, size: 18),
              const SizedBox(width: 8),
              Text("Fast Withdrawals", style: AppTypography.bodyMedium.copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
              const SizedBox(width: 50), // Gap before repeat
            ],
          );
        },
      ),
    );
  }
}