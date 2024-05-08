import 'package:flutter/material.dart';
import 'notificationsettings_screen.dart';
import 'themes_screen.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        children: [
          ListTile(
            title: Text('Themes'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ThemeSelectionScreen()),
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text('Notification Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationSettingsScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
