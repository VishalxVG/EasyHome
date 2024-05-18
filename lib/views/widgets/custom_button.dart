// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

Widget CustomButton(
  BuildContext context, {
  String? selectedButton = "LOGIN",
  String title = "SIGN UP",
  IconData? icon,
  void Function()? func,
}) {
  return GestureDetector(
    onTap: func,
    child: Container(
      decoration: BoxDecoration(
        color: selectedButton == title
            ? Theme.of(context).colorScheme.surface
            : Theme.of(context).colorScheme.primary,
        border: Border.all(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      height: 50,
      width: 170,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: selectedButton == title
                ? Theme.of(context).colorScheme.onSurface
                : Theme.of(context).colorScheme.onPrimary,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: selectedButton == title
                  ? Theme.of(context).colorScheme.onSurface
                  : Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget LoginSingUpButton(
  BuildContext context, {
  String title = "LOGIN",
  void Function()? func,
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Theme.of(context).colorScheme.primary,
      minimumSize: const Size(170, 50), // custom width and height
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    ),
    onPressed: func,
    child: Text(
      title,
      style: TextStyle(
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    ),
  );
}
