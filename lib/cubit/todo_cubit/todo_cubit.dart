import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'package:http/http.dart';
import 'package:ocdear/cubit/todo_cubit/todo_state.dart';
import 'package:ocdear/screen/user_app/child_mode/navigation_child/todo_screen/model/task.dart';

class ToDoCubit extends Cubit<ToDoState> {
  ToDoCubit() : super(ToDoInitialState());
  late List<Task> tasks;
  void getTask() async {
    emit(ToDoInitialState());
    try {
      Response response =
          await http.get(Uri.parse("http://10.0.2.2:8000/api/taskssweoouu"));
      // print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%${response.body}");

      Map<String, dynamic> ResponseBody = jsonDecode(response.body);

      print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%$ResponseBody");

      tasks = ResponseBody['tasks'].map((e) => Task.fromMap(e)).toList();
      print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%${tasks.length}");
      emit(ToDoSuccessState());
    } catch (e) {
      emit(ToDoFailedState(message: "error"));
    }
  }
}
