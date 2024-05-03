import 'package:flutter/material.dart';
import 'accountsettings_screen.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2a9d8f),
        title: Text('Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Icon(
                Icons.account_circle,
                size: 100,
              ),
            ),
            SizedBox(height: 10),
            Card(
              child: ListTile(
                title: Text(
                  'Name: John Doe',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 10),
            Card(
              child: ListTile(
                title: Text(
                  'Email: johndoe@example.com',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 10),
            Card(
              child: ListTile(
                title: Text(
                  'Ongoing Tasks: 5',
                  style: TextStyle(fontSize: 18, color: Colors.green),
                ),
              ),
            ),
            SizedBox(height: 10),
            Card(
              child: ListTile(
                title: Text(
                  'Ongoing Projects: 2',
                  style: TextStyle(fontSize: 18, color: Colors.purple),
                ),
              ),
            ),
            SizedBox(height: 10),
            Card(
              child: ListTile(
                title: Text(
                  'Ongoing Goals: 3',
                  style: TextStyle(fontSize: 18, color: Colors.pinkAccent),
                ),
              ),
            ),
            SizedBox(height: 10),
            Card(
              child: ListTile(
                title: Text(
                  'Ongoing Events: 4',
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
              ),
            ),
            SizedBox(height: 10),
            // Account Settings
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccountSettingsScreen()),
                );
              },
              child: Card(
                color: Colors.black,
                child: ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Account Settings',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
