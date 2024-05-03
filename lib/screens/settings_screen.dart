import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2a9d8f),
        title: Text('Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        children: [
          ListTile(
            title: Text('Themes'),
            onTap: () {
              // Tema seçeneklerinin bulunduğu sayfaya yönlendirme işlemi
            },
          ),
          Divider(),
          ListTile(
            title: Text('Notification Settings'),
            onTap: () {
              // Bildirim Ayarları sayfasına yönlendirme işlemi
            },
          ),
          Divider(),
          ListTile(
            title: Text('Activity Notifications'),
            onTap: () {
              // Etkinlik Bildirimleri sayfasına yönlendirme işlemi
            },
          ),
          Divider(),
          ListTile(
            title: Text('Backup and Restore'),
            onTap: () {
              // Yedekleme ve Geri Yükleme sayfasına yönlendirme işlemi
            },
          ),
        ],
      ),
    );
  }
}
