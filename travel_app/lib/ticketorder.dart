import 'package:flutter/material.dart';

void main() {
  runApp(TravelApp());
}

class TravelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TravelBookingPage(),
    );
  }
}

class TicketType {
  final String name;
  final double price;

  TicketType({required this.name, required this.price});
}

class TravelBookingPage extends StatefulWidget {
  @override
  _TravelBookingPageState createState() => _TravelBookingPageState();
}

class _TravelBookingPageState extends State<TravelBookingPage> {
  String? selectedTicketType = 'Economy';
  DateTime selectedDate = DateTime.now();

  List<TicketType> ticketTypes = [
    TicketType(name: 'Economy', price: 500),
    TicketType(name: 'Business', price: 1000),
    TicketType(name: 'First Class', price: 1500),
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2021),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Travel Booking',
          style: TextStyle(
            fontFamily: 'Trajan Pro',
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 78, 124, 162),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Select your travel date:',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(height: 10.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.grey),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Text(
                      "${selectedDate.toLocal()}".split(' ')[0],
                      style: TextStyle(fontSize: 16.0),
                    ),
                    trailing: Icon(Icons.calendar_today),
                    onTap: () => _selectDate(context),
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Select the type of ticket:',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(height: 10.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.grey),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedTicketType,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedTicketType = newValue;
                        });
                      },
                      items: ticketTypes
                          .map<DropdownMenuItem<String>>((TicketType value) {
                        return DropdownMenuItem<String>(
                          value: value.name,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  value.name,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  '\$${value.price.toString()}',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Confirmation'),
                          content: Text('Ticket is booked'),
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
}
