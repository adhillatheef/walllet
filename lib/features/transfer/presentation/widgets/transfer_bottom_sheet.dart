import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import 'swipe_button.dart';

class TransferBottomSheet extends StatefulWidget {
  const TransferBottomSheet({super.key});

  @override
  State<TransferBottomSheet> createState() => _TransferBottomSheetState();
}

class _TransferBottomSheetState extends State<TransferBottomSheet> {
  final TextEditingController _amountController = TextEditingController(text: "0");
  String _convertedValue = "0.00";
  final double _conversionRate = 88.68;

  @override
  void initState() {
    super.initState();
    _amountController.addListener(_updateConversion);
  }

  void _updateConversion() {
    final text = _amountController.text;
    if (text.isEmpty) {
      setState(() => _convertedValue = "0.00");
      return;
    }
    try {
      final double value = double.parse(text);
      final double converted = value * _conversionRate;
      setState(() {
        _convertedValue = converted.toStringAsFixed(2);
      });
    } catch (e) {
      // ignore
    }
  }

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
          // 1. Handle Bar (Small & Grey)
          Container(
            width: 32,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 32),

          // 2. Amount Input Section
          Text(
              "Enter Amount to be transferred",
              style: AppTypography.bodySmall.copyWith(color: Colors.grey)
          ),
          const SizedBox(height: 12),

          // Row for $ and Input
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                  "\$",
                  style: AppTypography.header.copyWith(
                      fontSize: 28,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.normal
                  )
              ),
              const SizedBox(width: 4),
              IntrinsicWidth(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  // Huge Font Size
                  style: AppTypography.header.copyWith(fontSize: 48, fontWeight: FontWeight.w500),
                  cursorColor: AppColors.primaryCyan,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            "Converted value will be $_convertedValue INR",
            style: AppTypography.bodySmall.copyWith(color: Colors.grey[600], fontSize: 11),
          ),
          const SizedBox(height: 32),

          // 3. Note Input (Dark Box)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFF0B0B0B), // Very dark bg
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                icon: const Icon(Icons.edit_note, color: Colors.grey, size: 20),
                hintText: "Type Note to be sent (Optional)",
                hintStyle: AppTypography.bodySmall.copyWith(color: Colors.grey[600]),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // 4. Recipient Dropdown (Dark Box)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: const Color(0xFF0B0B0B), // Very dark bg
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    "Select Recipient wallet",
                    style: AppTypography.bodyMedium.copyWith(color: Colors.grey[400])
                ),
                Icon(Icons.unfold_more, color: Colors.grey[600], size: 20),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // 5. Visual Flow (Sender -> Recipient)
          Row(
            children: [
              // Sender Card
              Expanded(
                child: _buildUserCard(
                    "Your Account", "Alicia Koch", "https://i.pravatar.cc/150?img=5"
                ),
              ),
              // Arrow Icon (White circle, Dark arrow)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_forward, size: 14, color: Colors.black),
              ),
              // Recipient Card
              Expanded(
                child: _buildUserCard(
                    "WLT 287292", "James McGee", "https://i.pravatar.cc/150?img=11"
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),

          // 6. Details Rows
          _buildDetailRow("Type", "MT5 Transfer"),
          const SizedBox(height: 12),
          _buildDetailRow("Sender ID", "WLT-2929292"),
          const SizedBox(height: 12),
          _buildDetailRow("Recipient ID", "WLT-9829653"),
          const SizedBox(height: 32),

          // 7. Swipe Button
          SwipeButton(
            onSwipeCompleted: () {
              Navigator.pop(context);
              // Trigger success screen logic
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildUserCard(String title, String subtitle, String imageUrl) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF0B0B0B), // Dark card bg
        borderRadius: BorderRadius.circular(16),
        // No border by default, or very subtle if needed
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(imageUrl),
          ),
          const SizedBox(height: 10),
          Text(
              title,
              style: AppTypography.bodyMedium.copyWith(fontWeight: FontWeight.w600, color: Colors.white)
          ),
          const SizedBox(height: 4),
          Text(
              subtitle,
              style: AppTypography.bodySmall.copyWith(fontSize: 11, color: Colors.grey)
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppTypography.bodySmall.copyWith(color: Colors.grey[600])),
        Text(value, style: AppTypography.bodyMedium.copyWith(color: Colors.white)),
      ],
    );
  }
}