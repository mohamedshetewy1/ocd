import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'model/task_model.dart';

Future<List<TasksModel>> loadTasks() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? taskList = prefs.getStringList('tasks');
  if (taskList != null) {
    return taskList
        .map((task) => TasksModel.fromJson(jsonDecode(task)))
        .toList();
  }
  return [];
}

Future<void> saveTasks(List<TasksModel> tasks) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> taskList =
      tasks.map((task) => jsonEncode(task.toJson())).toList();
  prefs.setStringList('tasks', taskList);
}
