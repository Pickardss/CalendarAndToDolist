import 'package:flutter/material.dart';
import 'accountsettings_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2a9d8f),
        title: const Text('Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Icon(
                Icons.account_circle,
                size: 100,
              ),
            ),
            const SizedBox(height: 10),
            const Card(
              child: ListTile(
                title: Text(
                  'Name: John Doe',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Card(
              child: ListTile(
                title: Text(
                  'Email: johndoe@example.com',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Card(
              child: ListTile(
                title: Text(
                  'Ongoing Tasks: 5',
                  style: TextStyle(fontSize: 18, color: Colors.green),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Card(
              child: ListTile(
                title: Text(
                  'Ongoing Projects: 2',
                  style: TextStyle(fontSize: 18, color: Colors.purple),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Card(
              child: ListTile(
                title: Text(
                  'Ongoing Goals: 3',
                  style: TextStyle(fontSize: 18, color: Colors.pinkAccent),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Card(
              child: ListTile(
                title: Text(
                  'Ongoing Events: 4',
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Account Settings
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AccountSettingsScreen()),
                );
              },
              child: const Card(
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
