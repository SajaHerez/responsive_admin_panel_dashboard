import 'package:flutter/material.dart';

class PanelLeftScreen extends StatefulWidget {
  const PanelLeftScreen({super.key});

  @override
  State<PanelLeftScreen> createState() => _PanelLeftScreenState();
}

class _PanelLeftScreenState extends State<PanelLeftScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
    );
  }
}