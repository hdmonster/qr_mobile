import 'package:flutter/services.dart';
import 'package:qr_mobile/app/data/models/location/location_interval_model.dart';

class LocationApi {
  static final LocationApi _instance = LocationApi._internal();
  LocationApi._internal();

  factory LocationApi() {
    return _instance;
  }

  static Future<List<LocationInterval>> getLocationInterval() async {
    String dir = 'assets/data/location_interval_data.json';

    try {
      final String response = await rootBundle.loadString(dir);

      return locationIntervalFromJson(response);
    } catch (e) {
      print('Location Interval error: ' + e.toString());
      return <LocationInterval>[];
    }
  }
}
