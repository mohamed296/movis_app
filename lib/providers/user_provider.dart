import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movis_app/models/firecase_hander.dart';
import 'package:movis_app/models/user.dart';

class UserProvider with ChangeNotifier {
  User currentuser;
  Future<String> signUp(String email, String password) async {
    try {
      currentuser = await FirebaseHander.instance.signUp(email, password);
    } on DioError catch (error) {
      if (error.response.data['error']['message'] == 'EMAIL_EXISTS') {
        return 'Email already exists.';
      } else if (error.response.data['error']['message'] ==
          'TOO_MANY_ATTEMPTS_TRY_LATER')
        return 'Too many attempts please try again later.';
    }
  }

  Future<String> logIn(String email, String password) async {
    try {
      currentuser = await FirebaseHander.instance.login(email, password);
      return null;
    } on DioError catch (error) {
      if (error.response.data['error']['message'] == 'EMAIL_NOT_FOUND' ||
          error.response.data['error']['message'] == 'INVALID_PASSWORD') {
        return 'Wrong email or password.';
      } else if (error.response.data['error']['message'] == 'USER_DISABLED')
        return 'This user has been disapled.';
    }
  }
}
