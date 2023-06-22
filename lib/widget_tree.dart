import 'package:flutter/material.dart';
import 'package:responsive_admin_panel_dashboard/screen/drawer_screen.dart';
import 'package:responsive_admin_panel_dashboard/screen/panel_center_screen.dart';
import 'package:responsive_admin_panel_dashboard/widget/custom_app_bar.dart';
import 'package:responsive_admin_panel_dashboard/widget/responsive_layout.dart';

import 'screen/panel_left_screen.dart';
import 'screen/panel_right_screen.dart';

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 100),
        child: (ResponsiveLayout.isTinyLimit(context) ||
                ResponsiveLayout.isTinyHeightLimit(context))
            ? Container()
            : CustomAppBar(),
      ),
      body: ResponsiveLayout(
        tiny: Container(),
        phone: const PanelCenterScreen(),
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
    ));
  }
}
