import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../models/Task.dart';

class TaskProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Task>> get tasksStream {
    return _firestore
        .collection('tasks')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Task.fromFirestore(doc)).toList());
  }

  // Thêm công việc mới
  Future<void> addTask(String title) async {
    try {
      await _firestore.collection('tasks').add({
        'title': title,
        'isCompleted': false,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Error adding task: $e');
    }
  }

  // Cập nhật trạng thái hoàn thành công việc
  Future<void> toggleTaskStatus(Task task) async {
    try {
      await _firestore.collection('tasks').doc(task.id).update({
        'isCompleted': !task.isCompleted,
      });
    } catch (e) {
      print('Error toggling task status: $e');
    }
  }

  // Xóa công việc
  Future<void> removeTask(Task task) async {
    try {
      await _firestore.collection('tasks').doc(task.id).delete();
    } catch (e) {
      print('Error deleting task: $e');
    }
  }

  // Lấy danh sách công việc đã hoàn thành
  Stream<List<Task>> get completedTasksStream {
    return _firestore
        .collection('tasks')
        .where('isCompleted', isEqualTo: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Task.fromFirestore(doc)).toList());
  }
}
