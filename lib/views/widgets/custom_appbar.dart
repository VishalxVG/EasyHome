import 'package:easyhome/consts/app_image.dart';
import 'package:flutter/material.dart';

SliverAppBar customAppBar(BuildContext context) {
  return SliverAppBar(
    actions: const [
      Padding(
        padding: EdgeInsets.only(right: 10),
        child: CircleAvatar(
          backgroundImage: AssetImage(AppImage.PROFILEIMAGE),
        ),
      )
    ],
    backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          width: 50,
        ),
        const Text(
          "Overview: ",
          style: TextStyle(fontSize: 20),
        ),
        TextButton(
          onPressed: () {},
          child: const Row(
            children: [
              Text("My House"),
              Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ],
    ),
    centerTitle: true,
    pinned: true,
    floating: true,
    expandedHeight: 100.0,
    flexibleSpace: const FlexibleSpaceBar(),
    bottom: const TabBar(
      tabs: [
        Tab(text: 'SPENDING'),
        Tab(text: 'TRANSACTIONS'),
      ],
    ),
  );
}
