import 'package:flutter/material.dart';

import '../resource/app_colors.dart';
import '../resource/app_padding.dart';
import '../widget/charts.dart';

class Product {
  String name;
  bool enable;
  Product({this.enable = true, required this.name});
}

class PanelRightScreen extends StatefulWidget {
  const PanelRightScreen({super.key});

  @override
  State<PanelRightScreen> createState() => _PanelRightScreenState();
}

class _PanelRightScreenState extends State<PanelRightScreen> {
  final List<Product> _products = [
    Product(name: "LED Submersible Lights", enable: true),
    Product(name: "Portable Projector", enable: true),
    Product(name: "Bluetooth Speaker", enable: true),
    Product(name: "Smart Watch", enable: true),
    Product(name: "Temporary Tattoos", enable: true),
    Product(name: "Bookends", enable: true),
    Product(name: "Vegetable Chopper", enable: true),
    Product(name: "Neck Massager", enable: true),
    Product(name: "Facial Cleanser", enable: true),
    Product(name: "Back Cushion", enable: true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(
                left: AppPadding.P10 / 2,
                top: AppPadding.P10 / 2,
                right: AppPadding.P10 / 2),
            child: Card(
              color: AppColors.purpleLight,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Container(
                width: double.infinity,
                child: const ListTile(
                  title: Text(
                    "Net Revenue",
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    "7% of Sales Avg.",
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Chip(
                    label: Text(
                      r"$46,450",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const LineChartSample1(),
          Padding(
            padding: const EdgeInsets.only(
                left: AppPadding.P10 / 2,
                top: AppPadding.P10 / 2,
                right: AppPadding.P10 / 2,
                bottom: AppPadding.P10),
            child: Card(
              color: AppColors.purpleLight,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                  children: List.generate(
                      _products.length,
                      (index) => SwitchListTile.adaptive(
                            title: Text(
                              _products[index].name,
                              style: const TextStyle(color: Colors.white),
                            ),
                            value: _products[index].enable,
                            onChanged: (newValue) {
                              setState(() {
                                _products[index].enable = newValue;
                              });
                            },
                          ))),
            ),
          )
        ]),
      ),
    );
  }
}
