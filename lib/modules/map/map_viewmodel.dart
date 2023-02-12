import 'dart:async';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nearest/services/network/api_repository.dart';

class MapViewModel extends GetxController {
  Completer<GoogleMapController> googleMapController = Completer();
  List<Placemark> placeAddress = [];
  Position? defaultPosition;
  dynamic markers;

  bool statusPermission = false;

  ApiRepository api = ApiRepository();

  @override
  void onInit() async {
    await getCurrentLocation();
    super.onInit();
  }

  Future<bool> getPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return false;
    }
    return true;
  }

  Future<void> getCurrentLocation() async {
    statusPermission = await getPermission();
    if (statusPermission) {
      defaultPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      markers = {
        Marker(
            markerId: MarkerId('$defaultPosition'),
            position: LatLng(defaultPosition!.latitude, defaultPosition!.longitude))
      };
      await getAddress();
    }

    update();
  }

  Future<void> getArea() async {
    await api.getNearestArea(
        longitude: defaultPosition!.longitude, latitude: defaultPosition!.latitude, areaName: "Restaurant");
  }

  Future<void> getAddress() async {
    placeAddress = await placemarkFromCoordinates(defaultPosition!.latitude, defaultPosition!.longitude);
  }
}
