import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';

class DetailScreen extends StatelessWidget {
  final Task task;

  const DetailScreen({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          task.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF2a9d8f),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF264653),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.place, color: const Color(0xFFe76f51)),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        task.activityPlace,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.access_time, color: const Color(0xFFe9c46a)),
                    SizedBox(width: 10),
                    Text(
                      'Start: ${task.startTime}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.access_time, color: const Color(0xFFe9c46a)),
                    SizedBox(width: 10),
                    Text(
                      'End: ${task.endTime}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.category, color: const Color(0xFF2a9d8f)),
                    SizedBox(width: 10),
                    Text(
                      'Type: ${task.activityType.toString().split('.').last}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF264653),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  task.description,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
