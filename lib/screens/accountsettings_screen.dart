import 'package:flutter/material.dart';
import 'package:todo_app/screens/login_screen.dart';

class AccountSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2a9d8f),
        title: Text('Account Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(
            title: Text('Edit Name'),
            onTap: () {
              // Edit Name işlemi
            },
          ),
          ListTile(
            title: Text('Change Password'),
            onTap: () {
              // Change Password işlemi
            },
          ),
          ListTile(
            title: Text('Change Email'),
            onTap: () {
              // Change Email işlemi
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.exit_to_app_outlined,
              color: Colors.red,
            ),
            title: Text(
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
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
