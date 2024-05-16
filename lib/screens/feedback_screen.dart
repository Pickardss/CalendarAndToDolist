import 'package:flutter/material.dart';

class HelpAndFeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help and Feedback'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: TextFormField(
                maxLines: null,
                maxLength: 250,
                decoration: InputDecoration(
                  labelText: 'Feedbacks (max 250 characters)',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Geri bildirimi gönderme işlemi
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Color(0xFF2a9d8f),
                ),
                foregroundColor: MaterialStateProperty.all<Color>(
                  Colors.black,
                ),
              ),
              child: Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HelpAndFeedbackPage(),
  ));
}
