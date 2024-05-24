import 'package:flutter/material.dart';

class ThemeSelectionScreen extends StatelessWidget {
  const ThemeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Selection'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Dark Mode'),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Dark Mode selected.'),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Light Mode'),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
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
