import 'package:easyhome/consts/app_image.dart';
import 'package:flutter/material.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(300),
            child: Image.asset(
              AppImage.NOTRANSACTION,
              width: 300,
              height: 300,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "NO TRANSACTION YET",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
