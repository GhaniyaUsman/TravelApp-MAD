// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:travel_app/hotelorder.dart';
import 'package:travel_app/secondpage.dart';

class TravelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: hotels(),
    );
  }
}

class hotels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hotels',
          style: TextStyle(
            fontFamily: 'Trajan Pro',
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 78, 124, 162),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondPage()),
            );
          },
        ),
      ),
      body: ListView(
        children: [
          GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HotelSelectionPage()),
            );
       },
      child: DestinationRow(
        imageUrl: 'assests/baku.jpg',
        destinationName: 'Baku, Azerbaijan',
        details: 'The city with the most beautiful landscape',
      ),
    ),
    GestureDetector( 
      onTap: () {
           Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HotelSelectionPage()),
            );
      },
          child:DestinationRow(
            imageUrl: 'assests/islamabad.jpeg',
            destinationName: 'Islamabad, Pakistan',
            details: 'The city with the most beautiful trails in the world',
          ),
    ),
          DestinationRow(
            imageUrl: 'assests/turkey.jpeg',
            destinationName: 'Istanbul, Turkey',
            details: 'The city with the most eye-catching mosques',
          ),
          DestinationRow(
            imageUrl: 'assests/burj2.jpg',
            destinationName: 'Dubai, UAE',
            details: 'The city with the most eye-catching mosques',
          ),
          DestinationRow(
            imageUrl: 'assests/seoul.jpg',
            destinationName: 'Seoul, South Korea',
            details: 'The city with the most eye-catching mosques',
          ),
          DestinationRow(
            imageUrl: 'assests/tokyo.jpg',
            destinationName: 'Tokyo, Japan',
            details: 'The city with the most eye-catching mosques',
          ),
          // Add more DestinationRow widgets here as needed
        ],
      ),
    );
  }
}

class DestinationRow extends StatelessWidget {
  final String imageUrl;
  final String destinationName;
  final String details;

  const DestinationRow({
    Key? key,
    required this.imageUrl,
    required this.destinationName,
    required this.details,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              height: 100,
              width: 100,
            ),
          ),
          SizedBox(width: 15.0),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  destinationName,
                  style: TextStyle(
                    fontFamily: 'Trajan Pro',
                  //  fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  details,
                  style: TextStyle(fontSize: 15.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
