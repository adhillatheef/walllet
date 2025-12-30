import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../features/home/presentation/pages/home_screen.dart'; // Import your Dashboard

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Total animation time
    );

    // 1. Fade in initially
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    // 2. Zoom massive at the end
    _scaleAnimation = Tween<double>(begin: 1.0, end: 50.0).animate(
      CurvedAnimation(
        parent: _controller,
        // Start zooming only after the fade in is done (at 60% of timeline)
        curve: const Interval(0.6, 1.0, curve: Curves.easeInOutExpo),
      ),
    );

    // Start the animation and listen for the end
    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _navigateToDashboard();
      }
    });
  }

  void _navigateToDashboard() {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) => const Scaffold(), // Or DashboardScreen
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Opacity(
                opacity: _opacityAnimation.value,
                child: SvgPicture.asset(
                  AppAssets.appLogo,
                  width: 80, // Start base size
                  height: 80,
                  // If your logo is single color, apply the Cyan brand color
                  // colorFilter: const ColorFilter.mode(AppColors.primaryCyan, BlendMode.srcIn),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}