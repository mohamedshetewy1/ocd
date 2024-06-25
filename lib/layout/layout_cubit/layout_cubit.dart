import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:ocdear/layout/layout_cubit/layout_states.dart';
import 'package:ocdear/models/profile_model.dart';
import 'package:ocdear/models/tasks_model.dart';
import 'package:ocdear/models/video_model.dart';
import 'package:ocdear/shared/constants/constants.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialState());
  User? userModel;

  void getUserData() async {
    emit(GetUserDataLoadingState());
    final Response response = await http.get(Uri.parse(
      "http://10.0.2.2:8000/api/auth/user-profile",
    ).replace(queryParameters: {
      'token': userToken,
    }));
    var responseData = jsonDecode(response.body);
    // print("userToken &&&&&&&&&&&&&&& is :${response.body}");

    userModel = User.fromJson(responseData);
    // print("userModel ****************************** is :${userModel!.email}");

    if (response.statusCode == 200) {
      //
      //
      //هنا ناقص حاجه هخدها من الجيسون
      print("response is :$responseData");
      emit(GetUserDataSuccessState());
    } else {
      print("response is :$responseData");
      emit(FailedToGetUserDataState(error: responseData['error']));
    }
  }

  List<VideoModel> video = [];

  void getVideoData() async {
    Response response =
        await http.get(Uri.parse("http://localhost:8000/videoshweoo"));

    final ResponseBody = jsonDecode(response.body);
    if (ResponseBody['access_token'] == true) {
      for (var item in ResponseBody['videos']) {
        // video.add(VideoModel.fromJson(item, videos: item));
      }

      emit(GetVideoSuccessState());
    } else {
      emit(FailedToGetVideoState());
    }
  }
}

class ApiService {
  static const String apiUrl = 'http://localhost:8000/api/taskssweoouu';

  Future<List<TasksModel>> fetchTasksModel() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      return body.map((dynamic item) => TasksModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load tasks');
    }
  }
}
