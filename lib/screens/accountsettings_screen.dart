import 'package:flutter/material.dart';
import 'package:todo_app/screens/login_screen.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2a9d8f),
        title: const Text('Account Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(
            title: const Text('Edit Name'),
            onTap: () {
              // Edit Name işlemi
            },
          ),
          ListTile(
            title: const Text('Change Password'),
            onTap: () {
              // Change Password işlemi
            },
          ),
          ListTile(
            title: const Text('Change Email'),
            onTap: () {
              // Change Email işlemi
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.exit_to_app_outlined,
              color: Colors.red,
            ),
            title: const Text(
              'Log out',
              style: TextStyle(
                color: Colors.red,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
