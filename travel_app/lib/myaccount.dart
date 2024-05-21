import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_app/secondpage.dart';

class TravelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyAccountScreen(),
    );
  }
}

class MyAccountScreen extends StatefulWidget {
  @override
  _MyAccountScreenState createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _contactInfoController = TextEditingController();
  TextEditingController _cardInfoController = TextEditingController();

  File? _imageFile;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Account',
          style: TextStyle(
            fontFamily: 'Trajan Pro',
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 78, 124, 162),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SecondPage()));
          },
        ),
      ),
      body: Builder(
        builder: (context) => SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildImage(),
              SizedBox(height: 20.0),
              _buildDataField(),
              SizedBox(height: 20.0),
              _buildSaveButton(context),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondPage()),
                  );
                },
                child: Text('Back to HomePage'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return GestureDetector(
      onTap: _getImage,
      child: Container(
        height: 200.0,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: _imageFile != null
            ? Image.file(
                _imageFile!,
                fit: BoxFit.cover,
              )
            : Icon(
                Icons.add_a_photo,
                size: 50.0,
              ),
      ),
    );
  }

  Widget _buildDataField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Name:'),
        SizedBox(height: 8),
        TextField(
          controller: _nameController,
          decoration: InputDecoration(
            labelText: 'Enter Name',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16),
        Text('Contact Info:'),
        SizedBox(height: 8),
        TextField(
          controller: _contactInfoController,
          decoration: InputDecoration(
            labelText: 'Enter Contact Info',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16),
        Text('Card Info:'),
        SizedBox(height: 8),
        TextField(
          controller: _cardInfoController,
          decoration: InputDecoration(
            labelText: 'Enter Card Info',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Add functionality to save data
        String name = _nameController.text;
        String contactInfo = _contactInfoController.text;
        String cardInfo = _cardInfoController.text;
        print('Name: $name, Contact Info: $contactInfo, Card Info: $cardInfo');
        // Add functionality to save image and data
        _showSaveConfirmation(context);
      },
      child: Text('Save'),
    );
  }

  void _showSaveConfirmation(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Information is saved'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
