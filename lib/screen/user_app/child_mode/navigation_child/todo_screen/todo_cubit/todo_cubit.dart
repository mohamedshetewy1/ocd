import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'package:http/http.dart';
import 'package:ocdear/screen/user_app/child_mode/navigation_child/todo_screen/todo_cubit/todo_state.dart';
import 'package:ocdear/screen/user_app/child_mode/navigation_child/todo_screen/model/task_model.dart';

class ToDoCubit extends Cubit<ToDoState> {
  ToDoCubit() : super(ToDoInitialState());
  List<TasksModel> tasks = [];

  void CreateTasks({
    required String t_insert_text,
  }) async {
    emit(CreateTasksLoadingState());
    Response response =
        await http.post(Uri.parse("http://10.0.2.2:8000/api/tasks"), body: {
      "t_insert_text": t_insert_text,
    });
    var responseBody = jsonDecode(response.body);
    TasksModel() = TasksModel.fromJson(responseBody);

    if (response.statusCode == 201) {
      emit(CreateTasksSuccessState());
      print(responseBody);
    } else {
      // emit error
      emit(CreateTasksFailedState(message: responseBody));
    }
  }

  /////////////////////////////////////////////////////////////////////////////

  // show tasks
  void getTask() async {
    emit(ToDoInitialState());
    try {
      Response response =
          await http.get(Uri.parse("http://10.0.2.2:8000/api/taskssweoouu"));

      var ResponseBody = jsonDecode(response.body);
      List taskData = ResponseBody["tasks"];
      // print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%$taskData");
      // for (var e in taskData) {
      //   TasksModel todo = TasksModel.fromJson(e);
      //   // tasks.add(todo);
      // }
      tasks = taskData.map((e) => TasksModel.fromJson(e)).toList();
      print("rtttttt%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%$tasks");
      emit(ToDoSuccessState());
    } catch (e) {
      emit(ToDoFailedState(message: "error"));
    }
  }
}
