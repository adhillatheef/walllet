import 'package:flutter/material.dart';
import '../../../../core/widgets/app_bottom_nav.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../home/presentation/pages/home_screen.dart';
import '../../../wallet/presentation/pages/wallet_screen.dart';
import '../../../support/presentation/pages/support_screen.dart';
import '../../../ib/presentation/pages/ib_screen.dart';

class MainWrapperPage extends StatefulWidget {
  const MainWrapperPage({super.key});

  @override
  State<MainWrapperPage> createState() => _MainWrapperPageState();
}

class _MainWrapperPageState extends State<MainWrapperPage> {
  int _currentIndex = 0;

  // The screens are kept alive in the stack
  final List<Widget> _pages = const [
    HomeScreen(),
    Placeholder(),
    Placeholder(),
    Placeholder(),
    // WalletScreen(),
    // SupportScreen(),
    // IbScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      // IndexedStack preserves the state of the pages
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      // We use a Stack to float the nav bar above the content if needed,
      // but standard bottomNavigationBar property works fine too.
      // Given the design has a floating look, we can just put it here.
      bottomNavigationBar: AppBottomNav(
        selectedIndex: _currentIndex,
        onIndexChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}