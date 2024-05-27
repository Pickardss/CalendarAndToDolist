import 'package:cloud_firestore/cloud_firestore.dart';

enum ActivityType { task, goal, project, event }

class Task {
  String id;
  String title;
  ActivityType activityType;
  DateTime startTime;
  DateTime endTime;
  String description;
  String activityPlace;
  DateTime date;

  Task({
    required this.id,
    required this.title,
    required this.activityType,
    required this.startTime,
    required this.endTime,
    required this.description,
    required this.activityPlace,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'activityType': activityType.toShortString(),
      'startTime': Timestamp.fromDate(startTime),
      'endTime': Timestamp.fromDate(endTime),
      'description': description,
      'activityPlace': activityPlace,
      'date': Timestamp.fromDate(date),
    };
  }

  static Task fromMap(String id, Map<String, dynamic> map) {
    return Task(
      id: id,
      title: map['title'],
      activityType: _parseActivityType(map['activityType']),
      startTime: (map['startTime'] as Timestamp).toDate(),
      endTime: (map['endTime'] as Timestamp).toDate(),
      description: map['description'],
      activityPlace: map['activityPlace'],
      date: (map['date'] as Timestamp).toDate(),
    );
  }

  static ActivityType _parseActivityType(String value) {
    switch (value.toLowerCase()) {
      case 'task':
        return ActivityType.task;
      case 'goal':
        return ActivityType.goal;
      case 'project':
        return ActivityType.project;
      case 'event':
        return ActivityType.event;
      default:
        throw Exception('Invalid activity type: $value');
    }
  }
}

extension ParseToString on ActivityType {
  String toShortString() {
    return toString().split('.').last;
  }
}
