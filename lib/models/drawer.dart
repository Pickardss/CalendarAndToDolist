import 'package:flutter/material.dart';
import 'package:todo_app/screens/start_screen.dart';
import 'package:todo_app/screens/settings_screen.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFFE4D546),
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            title: Text('Settings'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.question_mark,
              color: Colors.black,
            ),
            title: Text('Help and Feedback'),
            onTap: () {
              // Geri bildirim sayfasına gitme işlemi
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.exit_to_app_outlined,
              color: Colors.red,
            ),
            title: Text(
              'Log Out',
              style: TextStyle(
                color: Colors.red,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              // Çıkış işlemi
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StartScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
