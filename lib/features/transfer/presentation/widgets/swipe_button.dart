import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class SwipeButton extends StatefulWidget {
  final VoidCallback onSwipeCompleted;

  const SwipeButton({super.key, required this.onSwipeCompleted});

  @override
  State<SwipeButton> createState() => _SwipeButtonState();
}

class _SwipeButtonState extends State<SwipeButton> {
  double _dragValue = 0.0;
  bool _isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.successGreen,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Stack(
        children: [
          // 1. The Text Label (Centered & Black)
          Center(
            child: Text(
              _isCompleted ? "Processing..." : "Swipe to Transfer",
              style: AppTypography.buttonText.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16
              ),
            ),
          ),

          // 2. The Draggable Circle
          Positioned(
            left: _dragValue + 4,
            top: 4,
            bottom: 4,
            child: GestureDetector(
              onHorizontalDragUpdate: (details) {
                if (_isCompleted) return;
                setState(() {
                  _dragValue += details.delta.dx;
                  _dragValue = _dragValue.clamp(0.0, MediaQuery.of(context).size.width - 48 - 48 - 8);
                });
              },
              onHorizontalDragEnd: (details) {
                if (_isCompleted) return;
                if (_dragValue > MediaQuery.of(context).size.width * 0.5) {
                  setState(() {
                    _dragValue = MediaQuery.of(context).size.width - 48 - 48 - 8;
                    _isCompleted = true;
                  });
                  widget.onSwipeCompleted();
                } else {
                  setState(() {
                    _dragValue = 0.0;
                  });
                }
              },
              child: Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.black, // FIXED: Black arrow
                    size: 24
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}