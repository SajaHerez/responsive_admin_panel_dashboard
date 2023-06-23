import 'package:flutter/material.dart';

import '../resource/app_colors.dart';
import '../resource/app_padding.dart';
import '../widget/bar_chat.dart';

class Person {
  String name;
  Color color;
  Person({required this.name, required this.color});
}

class PanelCenterScreen extends StatefulWidget {
  const PanelCenterScreen({super.key});

  @override
  State<PanelCenterScreen> createState() => _PanelCenterScreenState();
}

class _PanelCenterScreenState extends State<PanelCenterScreen> {
  final List<Person> _persons = [
    Person(name: "Theia Bowen", color: Color(0xfff8b250)),
    Person(name: "Fariha Odling", color: Color(0xffff5182)),
    Person(name: "Viola Willis", color: Color(0xff0293ee)),
    Person(name: "Emmett Forrest", color: Color(0xfff8b250)),
    Person(name: "Nick Jarvis", color: Color(0xff13d38e)),
    Person(name: "ThAmit Clayeia", color: Color(0xfff8b250)),
    Person(name: "ThAmalie Howardeia", color: Color(0xffff5182)),
    Person(name: "Campbell Britton", color: Color(0xff0293ee)),
    Person(name: "Haley Mellor", color: Color(0xffff5182)),
    Person(name: "Harlen Higgins", color: Color(0xff13d38e)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                        "Products Available",
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        "82% of Products Avail.",
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Chip(
                        label: Text(
                          "20,500",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )),
            ),
            BarChartSample2(),
            Padding(
              padding: const EdgeInsets.only(
                  left: AppPadding.P10 / 2,
                  top: AppPadding.P10,
                  bottom: AppPadding.P10,
                  right: AppPadding.P10 / 2),
              child: Card(
                color: AppColors.purpleLight,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Column(
                  children: List.generate(
                      _persons.length,
                      (index) => ListTile(
                            leading: CircleAvatar(
                              radius: 15,
                              backgroundColor: _persons[index].color,
                              child: Text(
                                _persons[index].name.substring(0, 1),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            title: Text(
                              _persons[index].name,
                              style: const TextStyle(color: Colors.white),
                            ),
                            trailing: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.message,
                                  color: Colors.white,
                                )),
                          )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
