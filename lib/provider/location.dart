import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationProvider extends ChangeNotifier {
  String _userLocation = '';

  String get userLocation => _userLocation;

  Future<void> updateUserLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      _userLocation =
          '${placemarks.first.country}, ${placemarks.first.locality}';
      notifyListeners();
    } catch (e) {
      print('Failed to get user location: $e');
    }
  }
}
