import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_admin_panel_dashboard/resource/app_colors.dart';
import 'package:responsive_admin_panel_dashboard/screen/drawer_screen.dart';
import 'package:responsive_admin_panel_dashboard/screen/panel_center_screen.dart';
import 'package:responsive_admin_panel_dashboard/widget/custom_app_bar.dart';
import 'package:responsive_admin_panel_dashboard/widget/responsive_layout.dart';

import 'screen/panel_left_screen.dart';
import 'screen/panel_right_screen.dart';

class WidgetTree extends StatefulWidget {
  WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  int currentIndex = 1;

  final List<Widget> _icons = const [
    Icon(Icons.add, size: 30),
    Icon(Icons.list, size: 30),
    Icon(Icons.compare_arrows, size: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 100),
        child: (ResponsiveLayout.isTinyLimit(context) ||
                ResponsiveLayout.isTinyHeightLimit(context))
            ? Container()
            : const CustomAppBar(),
      ),
      body: ResponsiveLayout(
        tiny: Container(),
        phone: currentIndex == 0
            ? const PanelLeftScreen()
            : currentIndex == 1
                ? const PanelCenterScreen()
                : const PanelRightScreen(),
        tablet: Row(
          children: const [
            Expanded(child: PanelLeftScreen()),
            Expanded(child: PanelRightScreen())
          ],
        ),
        largeTablet: Row(
          children: const [
            Expanded(child: PanelLeftScreen()),
            Expanded(child: PanelCenterScreen()),
            Expanded(child: PanelRightScreen())
          ],
        ),
        computer: Row(
          children: const [
            Expanded(child: DrawerScreen()),
            Expanded(child: PanelLeftScreen()),
            Expanded(child: PanelCenterScreen()),
            Expanded(child: PanelRightScreen())
          ],
        ),
      ),
      drawer: const DrawerScreen(),
      bottomNavigationBar: ResponsiveLayout.isPhoneLimit(context)
          ? CurvedNavigationBar(
              backgroundColor: AppColors.purpleDark,
              color: Colors.white24,
              index: currentIndex,
              items: _icons,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            )
          : const SizedBox(),
    ));
  }
}
