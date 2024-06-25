import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'task.dart';
import 'package:ocdear/utils/colors.dart';
import 'package:ocdear/utils/text_style.dart';

class TodoTab extends StatefulWidget {
  const TodoTab({Key? key}) : super(key: key);

  @override
  _TodoTabState createState() => _TodoTabState();
}

class _TodoTabState extends State<TodoTab> {
  final TextEditingController _taskController = TextEditingController();
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    // Load tasks from cache or main memory
    _loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'قائمة المهام',
            style: AppTextStyle.textStyleNormal20,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: DottedBorder(
                borderType: BorderType.RRect,
                color: Colors.black,
                radius: const Radius.circular(5),
                borderPadding: const EdgeInsets.all(1),
                child: ElevatedButton(
                  onPressed: () {
                    _showAddTaskDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(double.maxFinite, 54),
                    foregroundColor: Colors.grey,
                    backgroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Spacer(),
                      Text('إضافة مهمة جديدة',
                          style: AppTextStyle.textStyleGrey16),
                      SizedBox(width: 5),
                      Icon(
                        Icons.add,
                        size: 30,
                        color: Color(0xff737373),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            if (tasks.isNotEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'اليوم',
                  style: AppTextStyle.textStyleBold18,
                ),
              ),
            Column(
              children: tasks.map((task) => buildTask(task)).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTask(Task task) {
    String emojiAsset = task.isCompleted
        ? 'assets/images/todo/smile.png'
        : 'assets/images/todo/sad.png'; // Replace with your asset path

    return Dismissible(
      key: Key(task.text),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        child: const Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Icon(Icons.delete, color: Colors.white),
        ),
      ),
      onDismissed: (direction) {
        // Remove the dismissed task from the list
        setState(() {
          tasks.remove(task);
          _saveTasks(); // Save updated tasks
        });
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.04),
            ),
          ],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Checkbox(
              activeColor: AppColors.normalActive,
              value: task.isCompleted,
              onChanged: (bool? value) {
                setState(() {
                  task.isCompleted = value ?? false;
                  _saveTasks(); // Save updated tasks
                });
              },
            ),
            Image.asset(
              emojiAsset,
              scale: 0.9, // Adjust size as needed
            ),
            const Spacer(),
            Text(
              task.text,
              style: AppTextStyle.textStyleGrey18,
            ),
          ],
        ),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            return AlertDialog(
              title: const Text(
                'إضافة مهمة جديدة',
                style: AppTextStyle.textStyleBlack14,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _taskController,
                    decoration: const InputDecoration(
                      labelStyle: AppTextStyle.textStyleGrey14,
                      labelText: 'نص المهمة',
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'إلغاء',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'ReadexPro',
                        fontWeight: FontWeight.w100,
                        color: Colors.red),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      tasks.add(Task(
                        text: _taskController.text,
                        isCompleted: false,
                      ));
                      _taskController.clear();
                      Navigator.of(context).pop();
                      _saveTasks(); // Save updated tasks
                    });
                  },
                  child: const Text(
                    'إضافة',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'ReadexPro',
                        fontWeight: FontWeight.w100,
                        color: AppColors.normalActive),
                  ),
                ),
              ],
            );
          },
        );
      },
    ).then((value) {
      // Trigger a rebuild of the widget tree after the dialog is closed
      setState(() {});
    });
  }

  // Function to load tasks from cache or main memory
  void _loadTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? taskList = prefs.getStringList('tasks');
    if (taskList != null && mounted) {
      // Check if the widget is still mounted
      setState(() {
        tasks = taskList.map((task) => Task.fromMap(jsonDecode(task))).toList();
      });
    }
  }

  // Function to save tasks to cache or main memory
  void _saveTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> taskList =
        tasks.map((task) => jsonEncode(task.toMap())).toList();
    prefs.setStringList('tasks', taskList);
  }
}
