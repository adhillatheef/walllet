import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../data/model/position_model.dart';
import '../widgets/pnl_header.dart';
import '../widgets/position_list_item.dart';

class InvestmentPnLScreen extends StatelessWidget {
  const InvestmentPnLScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock Data for Simulation
    final List<PositionModel> positions = [
      PositionModel(
          id: "1", symbol: "USDXAU", type: "Buy", volume: 100,
          entryPrice: 122.00, currentPrice: 100.00,
          stopLoss: 10, takeProfit: 40, swap: 20, profit: 22.00
      ),
      PositionModel(
          id: "2", symbol: "USDXEUR", type: "Sell", volume: 150,
          entryPrice: 160.00, currentPrice: 150.00,
          stopLoss: 15, takeProfit: 45, swap: 10, profit: -12.00
      ),
      PositionModel(
          id: "3", symbol: "USDXJPY", type: "Buy", volume: 200,
          entryPrice: 195.00, currentPrice: 200.00,
          stopLoss: 20, takeProfit: 60, swap: 5, profit: 45.00
      ),
      PositionModel(
          id: "4", symbol: "BTCUSD", type: "Buy", volume: 0.5,
          entryPrice: 27500.00, currentPrice: 28100.00,
          stopLoss: 26000, takeProfit: 30000, swap: -5, profit: 300.00
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackground,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Header Section
            const PnLHeader(),

            // 2. Search & List Section
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),              decoration: const BoxDecoration(
                color: Colors.black, // Darker bg for list area
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                children: [
                  // Search Bar
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: AppColors.inputBackground,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.divider),
                          ),
                          child: TextField(
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hint: Text("Search Investments"),
                              hintStyle: AppTypography.bodySmall,
                              prefixIcon: const Icon(Icons.search, color: Colors.grey),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: AppColors.inputBackground,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.divider),
                        ),
                        child: const Icon(Icons.filter_list, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Table Headers
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        Expanded(flex: 3, child: Text("Symbol", style: AppTypography.bodySmall)),
                        Expanded(flex: 2, child: Text("Units", style: AppTypography.bodySmall, textAlign: TextAlign.center)),
                        Expanded(flex: 2, child: Text("Price", style: AppTypography.bodySmall)),
                        Expanded(flex: 3, child: Text("Floating P/L", style: AppTypography.bodySmall, textAlign: TextAlign.right)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // 3. The List of Investments
                  ...positions.map((p) => PositionListItem(initialPosition: p)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}