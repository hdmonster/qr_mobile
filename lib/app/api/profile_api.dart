import 'package:flutter/services.dart';
import 'package:qr_mobile/app/data/models/account/profile.dart';

class ProfileApi {
  static final ProfileApi _instance = ProfileApi._internal();
  ProfileApi._internal();

  factory ProfileApi() {
    return _instance;
  }

  static Future getProfile(String uid) async {
    String dir = 'assets/data/profile.json';

    try {
      final String response = await rootBundle.loadString(dir);
      return profileFromJson(response);
    } catch (e) {
      throw ('Error getting profile' + e.toString());
    }
  }
}
