import 'package:flutter/material.dart';
import 'package:travel_app/hotels.dart';

void main() {
  runApp(HotelSelectionPage());
}

class TravelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HotelSelectionPage(),
    );
  }
}

class HotelSelectionPage extends StatefulWidget {
  @override
  _HotelSelectionPageState createState() => _HotelSelectionPageState();
}

class _HotelSelectionPageState extends State<HotelSelectionPage> {
  String? selectedHotelType = 'Luxury';
  String? selectedHotel = 'Hotel A';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hotel Booking',
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
              MaterialPageRoute(builder: (context) => hotels()),
            );
          },
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildDropdownBox(
                  text: 'Select the type of hotel:',
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedHotelType,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedHotelType = newValue;
                        });
                      },
                      items: <String>['Luxury', 'Boutique', 'Resort', 'Budget']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              value,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Selected Hotel Type: $selectedHotelType',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 20.0),
                _buildDropdownBox(
                  text: 'Select a hotel:',
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedHotel,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedHotel = newValue;
                        });
                      },
                      items: <String>['Hotel A', 'Hotel B', 'Hotel C', 'Hotel D']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              value,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(height: 20.0, width:150),
                Text(
                  'Selected Hotel: $selectedHotel',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Confirmation'),
                          content: Text('Hotel is booked'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                    // For demonstration, let's print the selected values
                    print('Selected Hotel Type: $selectedHotelType');
                    print('Selected Hotel: $selectedHotel');
                  },
                  child: Text('Save'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownBox({required String text, required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(fontSize: 20.0),
              textAlign: TextAlign.right,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
