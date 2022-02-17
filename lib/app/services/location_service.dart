import 'dart:async';

import 'package:location/location.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qr_mobile/app/data/models/location/user_location.dart';

class LocationService {
  static int alarmId = 0;

  static final LocationService _instance = LocationService._internal();
  LocationService._internal();

  factory LocationService() {
    return _instance;
  }

  static void init() {
    final storage = GetStorage();

    if (storage.read('location') != null) {
      final data = storage.read('location') as Map<String, dynamic>;
      sendPeriodicLocation(data['duration']);
    }
  }

  static Future<void> sendPeriodicLocation(duration) async {
    Timer.periodic(Duration(seconds: duration), (timer) {
      _printCurrentLocation();
    });
  }

  static void _printCurrentLocation() {
    try {
      getLocation().then((coor) {
        print('Current location: ${coor.latitude}, ${coor.longitude}');
      });
    } catch (e) {
      print('Error occured while getting location: $e');
    }
  }

  static Future getLocation() async {
    Location location = new Location();
    PermissionStatus _permissionGranted;
    UserLocation _userLocation;
    LocationData _locationData;

    bool _serviceEnabled;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    _userLocation = UserLocation(
      latitude: _locationData.latitude!,
      longitude: _locationData.longitude!,
    );

    return _userLocation;
  }
}
