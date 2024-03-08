import 'package:flutter/material.dart';
import 'package:flutter_revision/task.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [Task()],
    );
  }
}
