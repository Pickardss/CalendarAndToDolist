import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class AddNewScreen extends StatefulWidget {
  const AddNewScreen({super.key});

  @override
  _AddNewScreenState createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  String? activityType;
  DateTime? startTime;
  DateTime? endTime;
  String? activityPlace;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2a9d8f),
        title: const Text('Add New'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Title
          const Text(
            'Title',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter title',
            ),
          ),
          const SizedBox(height: 16),
          // Activity Type
          const Text(
            'Activity Type',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            items: ['Task', 'Project', 'Goal', 'Event'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? value) {
              setState(() {
                activityType = value;
              });
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Select activity type',
            ),
          ),
          const SizedBox(height: 16),
          // Start Time
          const Text(
            'Start Time',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          DateTimePicker(
            type: DateTimePickerType.dateTime,
            initialValue: DateTime.now().toString(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
            onChanged: (val) => startTime = DateTime.parse(val),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Select start time',
            ),
          ),
          const SizedBox(height: 16),
          // End Time
          const Text(
            'End Time',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          DateTimePicker(
            type: DateTimePickerType.dateTime,
            initialValue: DateTime.now().toString(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
            onChanged: (val) => endTime = DateTime.parse(val),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Select end time',
            ),
          ),
          const SizedBox(height: 16),
          // Description
          const Text(
            'Description',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: descriptionController,
            maxLines: 3,
            inputFormatters: [LengthLimitingTextInputFormatter(30)],
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter description',
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Maximum 30 characters',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 16),
          // Activity Place
          const Text(
            'Activity Place',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            items: ['Indoor', 'Outdoor'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? value) {
              setState(() {
                activityPlace = value;
              });
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Select activity place',
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () async {
              if (titleController.text.isEmpty ||
                  activityType == null ||
                  startTime == null ||
                  endTime == null ||
                  descriptionController.text.isEmpty ||
                  activityPlace == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please fill all fields'),
                  ),
                );
                return;
              }

              // Adding a new item to Firestore
              try {
                await FirebaseFirestore.instance.collection('tasks').add({
                  'title': titleController.text,
                  'activityType': activityType,
                  'startTime': Timestamp.fromDate(startTime!),
                  'endTime': Timestamp.fromDate(endTime!),
                  'description': descriptionController.text,
                  'activityPlace': activityPlace,
                  'date': Timestamp.fromDate(startTime!),
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Activity added successfully'),
                  ),
                );
                Navigator.pop(context);
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Failed to add activity: $e'),
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2a9d8f),
            ),
            child: const Text(
              'Add',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
