import 'package:flutter/material.dart';

class ThemeSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Selection'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Dark Mode'),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Dark Mode selected.'),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Light Mode'),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Light Mode selected.'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
