import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/services.dart';

class AddNewScreen extends StatelessWidget {
  const AddNewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2a9d8f),
        title: const Text('Add New'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Title',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter title',
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Activity Type',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  items: ['Task', 'Project', 'Goal', 'Event']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {}, // Değişen değeri String? olarak alma
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Select activity type',
                  ),
                ),
                const SizedBox(height: 16),
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
                  onChanged: (val) => print(val),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Select start time',
                  ),
                ),
                const SizedBox(height: 16),
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
                  onChanged: (val) => print(val),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Select end time',
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
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
                const Text(
                  'Activity Place',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  items: ['Indoor', 'Outdoor']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {}, // Değişen değeri String? olarak alma
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Select activity place',
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    // Ekleme işlemi
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(const Color(0xFF2a9d8f)),
                  ),
                  child: const Text(
                    'Add',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
