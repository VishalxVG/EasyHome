import 'package:easyhome/views/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

Widget buildPage(int index, BuildContext context) {
  List<Widget> widget = [
    const HomePage(),
    Container(
      color: Theme.of(context).colorScheme.surface,
      child: const Center(child: Text("TRANSACTION PAGE")),
    ),
    Container(
      color: Theme.of(context).colorScheme.surface,
      child: const Center(child: Text("TENNET PAGE")),
    ),
    Container(
      color: Theme.of(context).colorScheme.surface,
      child: const Center(child: Text("PROFILE PAGE")),
    )
  ];

  return widget[index];
}

var bottomTabs = [
  MoltenTab(
    icon: const Icon(Icons.home),
    // title: const Column(
    //   children: [
    //     SizedBox(
    //       height: 5,
    //     ),
    //     Text(
    //       "HOME",
    //       style: TextStyle(fontSize: 12),
    //     ),
    //   ],
    // ),
  ),
  MoltenTab(
    icon: const Icon(Icons.file_copy),
  ),
  MoltenTab(
    icon: const Icon(Icons.people),
  ),
  MoltenTab(
    icon: const Icon(Icons.person_pin),
  ),
];
