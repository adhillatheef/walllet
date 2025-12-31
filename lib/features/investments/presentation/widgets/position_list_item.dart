import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../data/model/position_model.dart';

class PositionListItem extends StatefulWidget {
  final PositionModel initialPosition;

  const PositionListItem({super.key, required this.initialPosition});

  @override
  State<PositionListItem> createState() => _PositionListItemState();
}

class _PositionListItemState extends State<PositionListItem> {
  late PositionModel position;
  bool isExpanded = false;
  Timer? _timer;

  // To flash colors when price updates
  Color currentPriceColor = Colors.white;
  Color pnlColor = Colors.white;

  @override
  void initState() {
    super.initState();
    position = widget.initialPosition;
    _startSimulation();
  }

  void _startSimulation() {
    // Updates the price every 1.5 seconds to look "live"
    _timer = Timer.periodic(const Duration(milliseconds: 1500), (timer) {
      if (!mounted) return;

      setState(() {
        // Randomly move price up or down by 0.05%
        final random = Random();
        final change = (random.nextDouble() - 0.5) * 2; // Range -1 to 1

        double newPrice = position.currentPrice + change;
        double newPnL = position.profit + (change * 10); // Rough PnL calc

        // Set "Flash" colors based on movement
        currentPriceColor = change > 0 ? AppColors.successGreen : AppColors.errorRed;

        // Update Model
        position = position.copyWith(
          currentPrice: newPrice,
          profit: newPnL,
        );
      });

      // Reset text color back to white after 500ms
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) {
          setState(() {
            currentPriceColor = Colors.white;
          });
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isProfit = position.profit >= 0;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.cardSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        children: [
          // 1. Visible Header (Always Shown)
          InkWell(
            onTap: () => setState(() => isExpanded = !isExpanded),
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(position.symbol, style: AppTypography.titleMedium.copyWith(fontSize: 14)), // Slightly smaller font if needed
                        const SizedBox(height: 4),
                        Text(position.type.toUpperCase(), style: AppTypography.bodySmall),
                      ],
                    ),
                  ),

                  Expanded(
                    flex: 2,
                    child: Text(
                      position.volume.toString(),
                      style: AppTypography.bodyMedium.copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  Expanded(
                    flex: 2,
                    child: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 300),
                      style: AppTypography.bodyMedium.copyWith(color: currentPriceColor),
                      child: FittedBox( // ADDED: Prevents overflow
                        fit: BoxFit.scaleDown,
                        child: Text(position.currentPrice.toStringAsFixed(2)),
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              "${isProfit ? '+' : ''}\$${position.profit.toStringAsFixed(2)}",
                              style: AppTypography.titleMedium.copyWith(
                                color: isProfit ? AppColors.successGreen : AppColors.errorRed,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        AnimatedRotation(
                          turns: isExpanded ? 0.5 : 0,
                          duration: const Duration(milliseconds: 200),
                          child: const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 18), // Slightly smaller icon
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          if (isExpanded)
            Container(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                children: [
                  const Divider(color: AppColors.divider),
                  const SizedBox(height: 12),
                  _detailRow("Open Price", "\$${position.entryPrice.toStringAsFixed(2)}"),
                  const SizedBox(height: 8),
                  _detailRow("Stop Loss", "\$${position.stopLoss.toStringAsFixed(2)}"),
                  const SizedBox(height: 8),
                  _detailRow("Take Profit", "\$${position.takeProfit.toStringAsFixed(2)}"),
                  const SizedBox(height: 8),
                  _detailRow("Swap", "+\$${position.swap.toStringAsFixed(2)}"),
                ],
              ),
            )
        ],
      ),
    );
  }

  Widget _detailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppTypography.bodySmall.copyWith(color: Colors.grey)),
        Text(value, style: AppTypography.bodyMedium.copyWith(color: Colors.white)),
      ],
    );
  }
}