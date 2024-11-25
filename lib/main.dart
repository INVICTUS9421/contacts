import 'package:contact_list_app/new.dart';
import 'package:flutter/material.dart';
import 'package:contact_list_app/contact.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contacts',
      debugShowCheckedModeBanner: false,
      home: ContactPage(),
      //home: NewContactPage(),
    );
  }
}
