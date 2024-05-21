// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:travel_app/explore.dart';
import 'package:travel_app/hotels.dart';
import 'package:travel_app/myaccount.dart';
import 'package:travel_app/populardestination.dart';
import 'package:travel_app/tickets.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Second page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MenuBar(),
    );
  }
}

class MenuBar extends StatefulWidget {
  @override
  _MenuBarState createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Vogayar',
          style: TextStyle(
            fontFamily: 'Trajan Pro',
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 78, 124, 162),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
      ),
      drawer: Drawer(
        child: Container(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text(
                  'Menu Bar',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 29, 68, 100),
                ),
              ),
              ListTile(
                title: Text('Home'),
                leading: IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SecondPage()),
                    );
                  },
                ),
                onTap: () {
                  // Add your onTap functionality here
                },
              ),
              ListTile(
                title: Text('Explore'),
                leading: IconButton(
                  icon: Icon(Icons.explore_rounded),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Explore()),
                    );
                  },
                ),
                onTap: () {
                  // Add your onTap functionality here
                },
              ),
              ListTile(
                title: Text('My Account'),
                leading: IconButton(
                  icon: Icon(Icons.account_circle),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MyAccountScreen()),
                    );
                  },
                ),
                onTap: () {
                  // Add your onTap functionality here
                },
              ),
              // Add more items as needed
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 140,
                  height: 70,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => hotels()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 121, 169, 218),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.black),
                      ),
                    ),
                    child: Icon(Icons.home_outlined, color: Colors.white),
                  ),
                ),
                
                SizedBox(
                  width: 140,
                  height: 70,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tickets()));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color.fromARGB(255, 121, 169, 218),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.black),
                      ),
                    ),
                    child: Icon(Icons.flight_takeoff, color: Colors.white),
                  ),
                ),
              ],
            ),

            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular Destination',
                  style: TextStyle(
                    fontFamily: 'Trajan Pro',
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Popular()),
                    );
                  },
                  child: Icon(Icons.arrow_forward_ios_outlined),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => NextPage()));
                    },
                    child: ImageBox(
                      imageUrl: 'assests/burj2.jpg',
                      description: 'Burj Khalifa, Dubai',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => NextPage()));
                    },
                    child: ImageBox(
                      imageUrl: 'assests/tokyo.jpg',
                      description: 'Tokyo, Japan',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => NextPage()));
                    },
                    child: ImageBox(
                      imageUrl: 'assests/maldives.jpeg',
                      description: 'Como, Maldives',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => NextPage()));
                    },
                    child: ImageBox(
                      imageUrl: 'assests/pyramids2.jpg',
                      description: 'Pyramids, Egypt',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => NextPage()));
                    },
                    child: ImageBox(
                      imageUrl: 'assests/turkey.jpeg',
                      description: 'Istanbul, Turkey',
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Explore',
                  style: TextStyle(
                    fontFamily: 'Trajan Pro',
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Explore()),
                    );
                  },
                  child: Icon(Icons.arrow_forward_ios_outlined),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ImageBox(
                    imageUrl: 'assests/burj2.jpg',
                    description: 'Dubai',
                  ),
                  ImageBox(
                    imageUrl: 'assests/tokyo.jpg',
                    description: 'Japan',
                  ),
                  ImageBox(
                    imageUrl: 'assests/maldives.jpeg',
                    description: 'Maldives',
                  ),
                  ImageBox(
                    imageUrl: 'assests/pyramids2.jpg',
                    description: 'Egypt',
                  ),
                  ImageBox(
                    imageUrl: 'assests/turkey.jpeg',
                    description: 'Turkey',
                  ),
                ],
              ),
            )
          ],
        
         
                 
      ),
    )
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
        border: Border.all(color: Colors.black),
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
