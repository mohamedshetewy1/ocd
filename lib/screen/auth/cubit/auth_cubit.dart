import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:ocdear/shared/network/local_network.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  void register(
      {required String name,
      required String email,
      required String age,
      required String phone,
      required String password}) async {
    emit(RegisterLoadingState());
    Response response = await http
        .post(Uri.parse("http://10.0.2.2:8000/api/auth/register"), body: {
      "name": name,
      "email": email,
      "Age": age,
      "phone": phone,
      "password": password,
    });
    var responseBody = jsonDecode(response.body);
    // if (responseBody["message"] == "User successfully registered") {
    //   //emit sucsess
    //   emit(RegisterSucsessState());
    // }
    if (response.statusCode == 201) {
      emit(RegisterSuccessState());
      print(responseBody);
      await CacheNetwork.insertToCache(key: "isLogin", value: "true");
      await CacheNetwork.insertToCache(
          key: "access_token", value: responseBody["access_token"]);
    } else {
      // emit error
      emit(RegisterFailedState(message: responseBody));
    }
  }

  void login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    try {
      Response response = await http.post(
        Uri.parse("http://10.0.2.2:8000/api/auth/login"),
        body: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        if (responseData['token_type'] == 'bearer') {
          debugPrint("User login success : $responseData");
          await CacheNetwork.insertToCache(
              key: "access_token", value: responseData["access_token"]);

          debugPrint(
              "User access_token success : ${responseData["access_token"]}");

          await CacheNetwork.insertToCache(key: "isLogin", value: "true");
          emit(LoginSuccessState());
        } else {
          debugPrint("Faild login : ${responseData['error']}");
          emit(LoginFailedState(error: responseData['error']));
        }
      }
    } catch (e) {
      emit(LoginFailedState(error: e.toString()));
    }
  }
}
