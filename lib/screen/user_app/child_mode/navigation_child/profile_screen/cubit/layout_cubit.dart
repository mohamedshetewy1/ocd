import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:ocdear/screen/user_app/child_mode/navigation_child/profile_screen/cubit/layout_states.dart';
import 'package:ocdear/models/profile_model.dart';
import 'package:ocdear/shared/constants/constants.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialState());
  User? userModel;

  void getUserData() async {
    emit(GetUserDataLoadingState());
    print("userModel ****************************** is :$userToken");

    try {
      final Response response = await http.get(
        Uri.parse(
          "http://10.0.2.2:8000/api/auth/user-profile",
        ).replace(queryParameters: {
          'token':
              "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvYXBpL2F1dGgvbG9naW4iLCJpYXQiOjE3MTk1ODQwNTYsImV4cCI6MTcxOTU4NzY1NiwibmJmIjoxNzE5NTg0MDU2LCJqdGkiOiJ4djl3RmpyRGpzZDJoUXIxIiwic3ViIjoiMTQiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.a7MnZ_sZC29lCETGMDxFLJCF-PuSRG27CS0u7loJ8tw"
        }),
      );

      var responseData = jsonDecode(response.body);
      userModel = User.fromJson(responseData);

      // print("userToken &&&&&&&&&&&&&&& is :${response.body}");
      // print("userModel ****************************** is :${userModel!.name}");

      // print("response is :$responseData");
      emit(GetUserDataSuccessState());
    } catch (e) {
      return emit(FailedToGetUserDataState(error: "failed user_access"));
    }
  }
}

abstract class EmailUpdateState extends Equatable {
  @override
  List<Object> get props => [];
}

class EmailUpdateInitial extends EmailUpdateState {}

class EmailUpdateLoading extends EmailUpdateState {}

class EmailUpdateSuccess extends EmailUpdateState {
  final String email;

  EmailUpdateSuccess(this.email);

  @override
  List<Object> get props => [email];
}

class EmailUpdateFailure extends EmailUpdateState {
  final String error;

  EmailUpdateFailure(this.error);

  @override
  List<Object> get props => [error];
}
