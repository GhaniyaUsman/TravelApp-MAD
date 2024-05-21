// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:travel_app/secondpage.dart';

class TravelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Explore(),
    );
  }
}

class Explore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Explore',
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
      body: ListView(
        children: [
          SizedBox(height: 20), // Add space after app bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  // Navigate to the next page
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage()));
                },
                child: ImageBox(
                  imageUrl: 'assests/burj2.jpg',
                  description: 'Dubai',
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to the next page
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage()));
                },
                child: ImageBox(
                  imageUrl: 'assests/tokyo.jpg',
                  description: 'Japan',
                ),
              ),
            ],
          ),
          SizedBox(height: 20), // Add space after app bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  // Navigate to the next page
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage()));
                },
                child: ImageBox(
                  imageUrl: 'assests/maldives.jpeg',
                  description: 'Maldives',
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to the next page
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage()));
                },
                child: ImageBox(
                  imageUrl: 'assests/pyramids2.jpg',
                  description: 'Egypt',
                ),
              ),
            ],
          ),
          SizedBox(height: 20), // Add space after app bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  // Navigate to the next page
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage()));
                },
                child: ImageBox(
                  imageUrl: 'assests/turkey.jpeg',
                  description: 'Turkey',
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to the next page
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage()));
                },
                child: ImageBox(
                  imageUrl: 'assests/tokyo.jpg',
                  description: 'Japan',
                ),
              ),
            ],
          ),
          SizedBox(height: 20), // Add space after app bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  // Navigate to the next page
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage()));
                },
                child: ImageBox(
                  imageUrl: 'assests/baku.jpg',
                  description: 'Azerbaijan',
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to the next page
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage()));
                },
                child: ImageBox(
                  imageUrl: 'assests/seoul.jpg',
                  description: 'South Korea',
                ),
              ),
            ],
          ),
          SizedBox(height: 20), // Add space after app bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  // Navigate to the next page
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage()));
                },
                child: ImageBox(
                  imageUrl: 'assests/islamabad.jpeg',
                  description: 'Pakistan',
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to the next page
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage()));
                },
                child: ImageBox(
                  imageUrl: 'assests/qatar.jpeg',
                  description: 'Qatar',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ImageBox extends StatelessWidget {
  final String imageUrl;
  final String description;

  const ImageBox({required this.imageUrl, this.description = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      width: 130, // Adjust the width as needed
      height: 150, // Adjust the height as needed
      decoration: BoxDecoration(
        border: Border.all(color : Colors.black),
      ),
      child: Stack(
        children: [
          Image.asset(
            imageUrl,
            fit: BoxFit.fitHeight,
            width: double.infinity,
            height: 113,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: Color.fromARGB(255, 78, 124, 162),
              padding: EdgeInsets.all(8.0),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
