import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  List<Contact> _contacts = [];
  List<Contact> _filteredContacts = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _requestPermission();
    _searchController.addListener(() {
      _filterContacts();
    });
  }

  Future<void> _requestPermission() async {
    if (await Permission.contacts.request().isGranted) {
      _getAllContacts();
    }
  }

  Future<void> _getAllContacts() async {
    Iterable<Contact> contacts = await ContactsService.getContacts();
    setState(() {
      _contacts = contacts.toList();
      _filteredContacts = _contacts;
    });
  }

  void _filterContacts() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredContacts = _contacts.where((contact) {
        return (contact.displayName?.toLowerCase().contains(query) ?? false);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredContacts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_filteredContacts[index].displayName ?? 'No Name'),
                  onTap: () {
                    // Display contact details
                    _showContactDetails(_filteredContacts[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showContactDetails(Contact contact) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(contact.displayName ?? 'No Name'),
          content: Text('Phone Numbers: ${contact.phones?.map((e) => e.value).join(", ") ?? "No phone number"}'),
          actions: [
            TextButton(
              child: Text('Close'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}