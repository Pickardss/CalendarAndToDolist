import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';

class AddNewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2a9d8f),
        title: Text('Add New'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Title',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter title',
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Activity Type',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  items: ['Task', 'Project', 'Goal', 'Event']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {}, // Değişen değeri String? olarak alın
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Select activity type',
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Start Time',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                DateTimePicker(
                  type: DateTimePickerType.dateTime,
                  initialValue: DateTime.now().toString(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  onChanged: (val) => print(val),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Select start time',
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'End Time',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                DateTimePicker(
                  type: DateTimePickerType.dateTime,
                  initialValue: DateTime.now().toString(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  onChanged: (val) => print(val),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Select end time',
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter description',
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Activity Place',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  items: ['Indoor', 'Outdoor']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {}, // Değişen değeri String? olarak alın
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Select activity place',
                  ),
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    // Ekleme işlemi
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFFE4D546)),
                  ),
                  child: Text('Add'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
