import 'package:flutter/material.dart';

class NewContactPage extends StatefulWidget {
  @override
  _NewContactPageState createState() => _NewContactPageState();
}

class _NewContactPageState extends State<NewContactPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _phone2Controller = TextEditingController();

  void _saveContact() {
    // You can add your save logic here
    _nameController.clear();
    _phoneController.clear();
    _phone2Controller.clear();
    _emailController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Contact'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white, // Use 'Colors.white' instead of 'Colors.White'
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column( // Corrected from 'Column()' to 'Column('
            mainAxisSize: MainAxisSize.min, // Optional: to fit the content
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone 1'),
                keyboardType: TextInputType.phone,
              ),
              TextField(
                controller: _phone2Controller,
                decoration: InputDecoration(labelText: 'Phone 2'),
                keyboardType: TextInputType.phone,
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveContact,
                child: Text('Save Contact'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}