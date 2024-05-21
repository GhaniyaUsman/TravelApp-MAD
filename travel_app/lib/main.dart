// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:travel_app/secondpage.dart';

void main() {
  runApp(TravelApp());
}

class TravelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assests/bk.jpg', 
            fit: BoxFit.cover,
          ),
          Align(
             alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top:90),
              child: Text(
                '~V o g a y a r~',
                style: TextStyle(
                  fontSize: 50,
                  fontFamily: 'Schyler',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),  
          ),
          // Add spacing between login box and additional text
            Align(
             alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom:30),
              child: Text(
                'Fly to your dreams',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Trajan Pro',
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

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assests/bk.jpg', // Corrected the asset path
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '~V o g a y a r~', // Add your text here
                  style: TextStyle(
                    fontSize: 26,
                    fontFamily: 'Schyler',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20), // Add spacing between text and login box
                Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Username',
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                        ),
                      ),
                      SizedBox(height: 20, width: 20),
                      OutlinedButton(
                        onPressed: () {
                           Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SecondPage();
                            }
                        )
                           );
                        },
                        child: Text('Login'),
                      ),
                      SizedBox(height: 10),
                      OutlinedButton(
                        onPressed: () {},
                        child: Text(' Sign In with Google'),
                      ),
                    ],
                  ),
                  
                ),
                SizedBox(height: 20), // Add spacing between login box and additional text
                Text(
                  'Forgot your password?', // Additional text
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  )
                ),  
              ],
            ),
          ),
        ],
      ),
    );
  }
}
