import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  var selected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: Stack(
        children: <Widget>[
          AnimatedPositioned(
            // height: 100,
            // width: selected ? 10 : 1,
            right: selected ? 0 : 300,
            left: selected ? 300 : 0,
            duration: const Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: Container(
                color: Colors.blue,
                height: 50,
                width: double.maxFinite,
                child: const Center(child: Text('Tap me')),
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
