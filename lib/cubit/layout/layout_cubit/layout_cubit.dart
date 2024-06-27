import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:ocdear/cubit/layout/layout_cubit/layout_states.dart';
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
              "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvYXBpL2F1dGgvbG9naW4iLCJpYXQiOjE3MTk0Mzk1NzEsImV4cCI6MTcxOTQ0MzE3MSwibmJmIjoxNzE5NDM5NTcxLCJqdGkiOiIwV2oyZGNvZXlsb2ZtdXEzIiwic3ViIjoiMTQiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.BLhGdj5pnHjup9L355Oz3k7BJEpVoEUbUZSB2xtI_cY",
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
