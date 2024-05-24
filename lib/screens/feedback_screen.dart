import 'package:flutter/material.dart';

class HelpAndFeedbackPage extends StatelessWidget {
  const HelpAndFeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help and Feedback'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: TextFormField(
                maxLines: null,
                maxLength: 250,
                decoration: const InputDecoration(
                  labelText: 'Feedbacks (max 250 characters)',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Geri bildirimi gönderme işlemi
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(
                  const Color(0xFF2a9d8f),
                ),
                foregroundColor: WidgetStateProperty.all<Color>(
                  Colors.black,
                ),
              ),
              child: const Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: HelpAndFeedbackPage(),
  ));
}
