import 'package:dio/dio.dart';
import 'package:movis_app/helpers/api_keys.dart';
import 'package:movis_app/models/user.dart';

class FirebaseHander {
  static FirebaseHander _instance = FirebaseHander._private();
  FirebaseHander._private();
  static FirebaseHander get instance => _instance;
  Dio _dio = Dio();

  Future<User> signUp(String email, String password) async {
    String url = "https://identitytoolkit.googleapis.com/v1/accounts:signUp?";
    final params = {'key': ApiKeys.firebasekey};
    Response response = await _dio.post(
      url,
      queryParameters: params,
      data: {
        'email': email,
        'password': password,
        'returnSecureToken': true,
      },
    );
    return User.fromjson(response.data);
  }

  Future<User> login(String email, String password) async {
    String url =
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?";
    final params = {'key': ApiKeys.firebasekey};
    Response response = await _dio.post(url, queryParameters: params, data: {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    });
    return User.fromjson(response.data);
  }
}
