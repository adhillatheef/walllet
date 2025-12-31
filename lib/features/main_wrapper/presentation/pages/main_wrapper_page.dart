import 'package:flutter/material.dart';
import '../../../../core/widgets/app_bottom_nav.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../home/presentation/pages/home_screen.dart';
import '../../../wallet/presentation/pages/wallet_screen.dart';

class MainWrapperPage extends StatefulWidget {
  const MainWrapperPage({super.key});

  @override
  State<MainWrapperPage> createState() => _MainWrapperPageState();
}

class _MainWrapperPageState extends State<MainWrapperPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    WalletScreen(),
    Placeholder(),
    Placeholder(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      // USE A STACK INSTEAD OF bottomNavigationBar
      body: Stack(
        children: [
          // Layer 1: The Content (IndexedStack)
          // We make it fill the entire screen
          Positioned.fill(
            child: IndexedStack(
              index: _currentIndex,
              children: _pages,
            ),
          ),

          // Layer 2: The Floating Navigation Bar
          // AppBottomNav already contains the Align(alignment: Alignment.bottomCenter)
          // so we can just drop it here.
          AppBottomNav(
            selectedIndex: _currentIndex,
            onIndexChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ],
      ),
    );
  }
}