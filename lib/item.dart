import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final image;
  final title;
  final int minutes;
  final int kcal;
  const Item(
      {super.key,
      required this.image,
      required this.title,
      required this.minutes,
      required this.kcal});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: const Color.fromARGB(108, 158, 158, 158), width: 1))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.blue,
                ),
                Image.network(
                  image,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.justify,
              ),
            ),
            Row(children: [
              Icon(CupertinoIcons.flame, size: 15),
              Text(
                " $kcal kcal  |  ",
                style: TextStyle(fontSize: 15),
              ),
              Icon(CupertinoIcons.clock, size: 15),
              Text(
                " $minutes minutes",
                style: TextStyle(fontSize: 15),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
