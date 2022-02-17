import 'package:get_storage/get_storage.dart';

class AuthApi {
  static final AuthApi _instance = AuthApi._internal();
  AuthApi._internal();

  factory AuthApi() {
    return _instance;
  }

  static Future signIn(String username, String password) async {
    return 'success';
  }

  static Future signOut() async {
    final session_box = GetStorage('session');

    try {
      session_box.remove('user');
      print('Signed out..');
    } catch (e) {
      return 'failed';
    }

    return 'success';
  }
}
