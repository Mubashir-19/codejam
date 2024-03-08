import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Center(
            child: Text(
          "MEAL APP",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
