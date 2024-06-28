import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:ocdear/screen/user_app/child_mode/navigation_child/todo_screen/bloc/bloc_exports.dart';
import 'package:ocdear/screen/user_app/child_mode/navigation_child/todo_screen/todo_cubit/todo_cubit.dart';
import 'package:ocdear/screen/user_app/child_mode/navigation_child/todo_screen/todo_cubit/todo_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'model/task_model.dart';
import 'package:ocdear/utils/colors.dart';
import 'package:ocdear/utils/text_style.dart';

class TodoTab extends StatefulWidget {
  const TodoTab({Key? key}) : super(key: key);

  //  void _addTAsk(BuildContext context){
  //   showModalBottomSheet(context: context, builder: (context) =>)
  //  }

  static const id = 'tasks_screen';

  @override
  _TodoTabState createState() => _TodoTabState();
}

class _TodoTabState extends State<TodoTab> {
  final TextEditingController _taskController = TextEditingController();
  // late List<TasksModel> tasks;

  @override
  void initState() {
    super.initState();
    // _loadTasks();
    BlocProvider.of<ToDoCubit>(context).getTask();
    // tasks = BlocProvider.of<ToDoCubit>(context).tasks;

    // print(
    // "TasksModel******************${BlocProvider.of<ToDoCubit>(context).tasks.length ?? 1}");
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
      body: BlocBuilder<ToDoCubit, ToDoState>(
        builder: (context, state) {
          return Column(
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
              if (BlocProvider.of<ToDoCubit>(context).tasks.isNotEmpty)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'اليوم',
                    style: AppTextStyle.textStyleBold18,
                  ),
                ),
              SizedBox(
                  height: MediaQuery.sizeOf(context).height * .7,
                  child: ListView.builder(
                      itemCount:
                          BlocProvider.of<ToDoCubit>(context).tasks.length,
                      itemBuilder: (context, index) {
                        // print(
                        //     "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA${BlocProvider.of<ToDoCubit>(context).tasks.length}");

                        return buildTask(
                            BlocProvider.of<ToDoCubit>(context).tasks[index]);
                      })),
            ],
          );
        },
      ),
    );
  }

  Widget buildTask(TasksModel task) {
    String emojiAsset = task.isDone
        ? 'assets/images/todo/smile.png'
        : 'assets/images/todo/sad.png';
    // Replace with your asset path

    return Dismissible(
      key: Key(task.tInsertText!),
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
          // tasks.remove(task);
          //  _saveTasks();// Save updated tasks
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
              value: task.isDone,
              onChanged: (bool? value) {
                // context.read<TasksBloc>().add(UpdateTask(task: task));
                setState(() {
                  ////////////////////////////////////////////////////////////////
                  task.isDone = value ?? false;
                  // _saveTasks(); // Save updated tasks
                });
              },
            ),
            Image.asset(
              emojiAsset,
              scale: 0.9, // Adjust size as needed
            ),
            const Spacer(),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * .7,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  task.tInsertText ?? "",
                  style: AppTextStyle.textStyleGrey18,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
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
                      // tasks.add(TasksModel(
                      //   tInsertText: _taskController.text,
                      //   isDone: false,
                      // ));
                      _taskController.clear();
                      Navigator.of(context).pop();
                      // _saveTasks(); // Save updated tasks
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
  // void _loadTasks() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   List<String>? taskList = prefs.getStringList('tasks');
  //   if (taskList != null && mounted) {
  //     // Check if the widget is still mounted
  //     setState(() {
  //       // tasks = taskList
  //       //     .map((task) => TasksModel.fromJson(jsonDecode(task)))
  //       //     .toList();
  //     });
  //   }
  // }

  // Function to save tasks to cache or main memory
  // void _saveTasks() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   List<String> taskList =
  //       tasks.map((task) => jsonEncode(task.toJson())).toList();
  //   prefs.setStringList('tasks', taskList);
  // }
}
