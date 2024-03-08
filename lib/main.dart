import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_revision/addfood.dart';
import 'package:flutter_revision/custom_appbar.dart';
import 'package:flutter_revision/firebase_options.dart';
import 'package:flutter_revision/item.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: const TextTheme(
              bodyMedium: TextStyle(color: Colors.black),
              displayLarge:
                  TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigate to the AddFoodPage when FAB is pressed
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddFoodPage()),
            );
          },
          tooltip: 'Add Food',
          child: Icon(Icons.add),
        ),
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
          child: CustomAppBar(),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: DatePicker(DateTime.now(),
                            height: 100,
                            width: 60,
                            initialSelectedDate: DateTime.now(),
                            selectionColor: Colors.black,
                            selectedTextColor: Colors.white,
                            dateTextStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                            dayTextStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey),
                            monthTextStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.shade500),
                            onDateChange: (date) {
                          setState(() {
                            _selectedDate = date;
                          });
                        }),
                      ),
                    ),
                    Text(
                      "15 Meals",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                        child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('Food')
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }

                        return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            var foodData = snapshot.data!.docs[index].data()
                                as Map<String, dynamic>;
                            print(foodData);
                            return Item(
                              title: foodData['title'],
                              kcal: foodData['kcal'],
                              minutes: foodData['minutes'],

                              image: "assets/food1.png",
                              // You can display other fields such as image here
                            );
                          },
                        );
                      },
                    )),
                  ],
                ),
              )
            ])));
  }
}



// ListView(
//                   children: [
//                     Item(
//                         image: "assets/food1.png",
//                         title: "Food 1",
//                         kcal: 135,
//                         minutes: 30),
//                     Item(
//                         image: "assets/food2.png",
//                         title: "Food 2",
//                         kcal: 155,
//                         minutes: 20),
//                     Item(
//                         image: "assets/food3.png",
//                         title: "Food 3",
//                         kcal: 99,
//                         minutes: 10),
//                   ],
//                 ),