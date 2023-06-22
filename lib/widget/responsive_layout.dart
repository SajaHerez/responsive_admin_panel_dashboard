import 'dart:html';

import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget tiny;
  final Widget phone;
  final Widget tablet;
  final Widget largeTablet;
  final Widget computer;
  const ResponsiveLayout(
      {super.key,
      required this.tiny,
      required this.phone,
      required this.tablet,
      required this.largeTablet,
      required this.computer});

  static final int tinyHeightLimit = 100;
  static final int tinyLimit = 270;
  static final int phoneLimit = 550;
  static final int tabletLimit = 800;
  static final int largeTabletLimit = 1100;

  static bool isTinyHeightLimit(BuildContext context) =>
      MediaQuery.of(context).size.height < tinyHeightLimit;
  static bool isTinyLimit(BuildContext context) =>
      MediaQuery.of(context).size.width < tinyLimit;
  static bool isPhoneLimit(BuildContext context) =>
      MediaQuery.of(context).size.width < phoneLimit &&
      MediaQuery.of(context).size.width >= tinyLimit;

  static bool isTabletLimit(BuildContext context) =>
      MediaQuery.of(context).size.width < tabletLimit &&
      MediaQuery.of(context).size.width >= phoneLimit;
  static bool isLargeTabletLimit(BuildContext context) =>
      MediaQuery.of(context).size.width < largeTabletLimit &&
      MediaQuery.of(context).size.width >= tabletLimit;

  static bool isComputer(BuildContext context) =>
      MediaQuery.of(context).size.width >= largeTabletLimit;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < tinyLimit ||
          constraints.maxHeight < tinyHeightLimit) {
        return tiny;
      }
      if (constraints.maxWidth < phoneLimit) {
        return phone;
      }
      if (constraints.maxWidth < tabletLimit) {
        return tablet;
      }
      if (constraints.maxWidth < largeTabletLimit) {
        return largeTablet;
      } else {
        return computer;
      }
    });
  }
}
