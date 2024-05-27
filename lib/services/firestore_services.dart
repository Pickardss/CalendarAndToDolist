import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addTask(Task task) async {
    try {
      await _db.collection('tasks').add(task.toMap());
    } catch (e) {
      print('Error adding task: $e');
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      await _db.collection('tasks').doc(task.id).update(task.toMap());
    } catch (e) {
      print('Error updating task: $e');
    }
  }

  Future<void> deleteTask(Task task) async {
    try {
      await _db.collection('tasks').doc(task.id).delete();
    } catch (e) {
      print('Error deleting task: $e');
    }
  }

  Stream<List<Task>> getTasks() {
    return _db.collection('tasks').snapshots().map((snapshot) => snapshot.docs
        .map((doc) => Task.fromMap(doc.id, doc.data() as Map<String, dynamic>))
        .toList());
  }
}
