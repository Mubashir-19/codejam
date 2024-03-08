import 'dart:io';
import 'dart:async';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddFoodPage extends StatefulWidget {
  @override
  _AddFoodPageState createState() => _AddFoodPageState();
}

class _AddFoodPageState extends State<AddFoodPage> {
  File? _imageFile;
  TextEditingController _titleController = TextEditingController();
  TextEditingController _kcalController = TextEditingController();
  TextEditingController _minutesController = TextEditingController();

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      }
    });
    print(_imageFile);
  }

  Future<String> uploadPic(File image1) async {
    print(image1);

    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child('${DateTime.now()}');

    try {
      // Upload file to Firebase Storage

      final TaskSnapshot snapshot = await ref.putFile(image1);

      // Get download URL
      String url = await snapshot.ref.getDownloadURL();

      // Return download URL
      return url;
    } catch (error) {
      // Handle errors
      print(error);
      return ''; // Return an empty string or handle error appropriately
    }
  }

  Future<void> _addFoodData() async {
    print(_imageFile);
    // FirebaseStorage _storage = FirebaseStorage.instance;
    // Upload the image to Firebase Storage (if an image is selected)
    String imageUrl = await uploadPic(_imageFile!);

    if (imageUrl != null) {
      try {
        // Add data to Firestore
        await FirebaseFirestore.instance.collection('Food').add({
          'title': _titleController.text,
          'kcal': int.tryParse(_kcalController.text) ?? 0,
          'minutes': int.tryParse(_minutesController.text) ?? 0,
          'image': imageUrl,
        });

        // Show a success message or navigate back to the previous screen
        Navigator.pop(context, true); // Pop the page with a success flag
      } catch (error) {
        // Handle errors during data addition
        print('Error adding food data: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Food'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _imageFile != null
                ? Image.file(
                    _imageFile!,
                    height: 150.0,
                    fit: BoxFit.cover,
                  )
                : Placeholder(
                    fallbackHeight: 150.0,
                    fallbackWidth: double.infinity,
                  ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick Image'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _kcalController,
              decoration: InputDecoration(labelText: 'Kcal'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _minutesController,
              decoration: InputDecoration(labelText: 'Minutes'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _addFoodData,
              child: Text('Add Food Data'),
            ),
          ],
        ),
      ),
    );
  }
}
