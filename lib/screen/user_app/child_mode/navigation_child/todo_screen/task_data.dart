import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'task.dart';

Future<List<Task>> loadTasks() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? taskList = prefs.getStringList('tasks');
  if (taskList != null) {
    return taskList.map((task) => Task.fromMap(jsonDecode(task))).toList();
  }
  return [];
}

Future<void> saveTasks(List<Task> tasks) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> taskList =
      tasks.map((task) => jsonEncode(task.toMap())).toList();
  prefs.setStringList('tasks', taskList);
}
