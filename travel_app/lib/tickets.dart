// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:travel_app/ticketorder.dart';

class TravelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: tickets(),
    );
  }
}

class tickets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tickets',
          style: TextStyle(
            fontFamily: 'Trajan Pro',
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 78, 124, 162),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20), // Add space after app bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildBox(
                name: 'Japan',
                imagePath: 'assests/tokyo.jpg',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TravelBookingPage()),
                  );
                },
              ),
              _buildBox(
                name: 'Dubai',
                imagePath: 'assests/Burj2.jpg',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TravelBookingPage()),
                  );
                },
              ),
            ],
          ),

          SizedBox(height: 20), // Add space between rows
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildBox(
                name: 'Maldives',
                imagePath: 'assests/maldives.jpeg',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TravelBookingPage()),
                  );
                },
              ),
              _buildBox(
                name: 'Turkey',
                imagePath: 'assests/turkey.jpeg',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TravelBookingPage()),
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 20), // Add space between rows
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildBox(
                name: 'Egypt',
                imagePath: 'assests/pyramids2.jpg',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TravelBookingPage()),
                  );
                },
              ),
              _buildBox(
                name: ' Qatar ',
                imagePath: 'assests/qatar.jpeg',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TravelBookingPage()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildBox({required String name, required String imagePath, required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 8), // Add spacing between image and text
        Text(
          name,
          style: TextStyle(fontSize: 16),
        ),
      ],
    ),
  );
}

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
      ),
      body: Center(
        child: Text('This is the next page'),
      ),
    );
  }
}
