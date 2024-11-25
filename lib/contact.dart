import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Contact App',
    home: ContactPage(),
  ));
}

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  String searchQuery = '';

  List<Map<String, String?>> contacts = [
    {
      'name': 'Alice',
      'phone1': '123-456-7890',
      'phone2': null, 
      'email': 'alice@example.com'
    },
    {
      'name': 'Bob',
      'phone1': '987-654-3210',
      'phone2': '555-555-5555',
      'email': null 
    },
    {
      'name': 'Charlie',
      'phone1': '555-555-5555',
      'phone2': null, 
      'email': 'charlie@example.com'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              height: 40, // Set a height for the TextField
              child: TextField(
                onChanged: (query) {
                  setState(() {
                    searchQuery = query; // Update the search query
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search contacts...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white, // Set the background color to white
        child: ListView(
          children: contacts
              .where((contact) => contact['name']!.toLowerCase().contains(searchQuery.toLowerCase()))
              .map((contact) {
            return ListTile(
              title: Text(contact['name']!),
              subtitle: Text(contact['phone1']! + (contact['phone2'] != null ? ' / ${contact['phone2']}' : '')),
              onTap: () {

              },
            );
          }).toList(),
        ),
      ),
    );
  }
}