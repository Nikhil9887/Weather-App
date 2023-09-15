import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


class Location {
  double? latitude;
  double? longitude;

  void requestPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    // print(permission);
  }

  void checkPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    // print(permission);
  }

  Future<void> getCurrentLocation() async {
    checkPermission();
    requestPermission();
    print("permission not grated yet");
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      latitude = position.latitude;
      longitude = position.longitude;
    print("permission grated ");

    } catch (e) {
      print(e);
    }
  }
}
