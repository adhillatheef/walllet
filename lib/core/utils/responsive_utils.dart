import 'package:flutter/material.dart';

class Responsive {
  // Get screen size
  static Size getSize(BuildContext context) => MediaQuery.of(context).size;

  // Get height/width based on percentage
  static double height(BuildContext context, double percentage) => MediaQuery.of(context).size.height * (percentage / 100);

  static double width(BuildContext context, double percentage) => MediaQuery.of(context).size.width * (percentage / 100);

  // Simple breakpoints
  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) => MediaQuery.of(context).size.width >= 600 && MediaQuery.of(context).size.width < 1200;
}

// Extension for easier usage: 20.h or 20.w
extension SizingExtension on num {
  double h(BuildContext context) => Responsive.height(context, toDouble());

  double w(BuildContext context) => Responsive.width(context, toDouble());
}
