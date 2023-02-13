import 'dart:async';

import 'package:geocoding/geocoding.dart' hide Location;
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nearest/models/map_model.dart';
import 'package:nearest/services/network/api_repository.dart';

class MapViewModel extends GetxController {

  Completer<GoogleMapController> googleMapController = Completer();
  List<Placemark> placeAddress = [];
  Position? defaultPosition;
  List<Position> nearbyPositionList = [];
  dynamic markers;

  bool statusPermission = false;
  bool isLoading = false;

  List<MapModel> listMap = [];
  // List<MapModel> get listMap => _listMap;

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
            markerId: MarkerId('0'),
            position: LatLng(defaultPosition!.latitude, defaultPosition!.longitude)),
      };
      await getAddress();
    }

    update();
  }

  Future<void> getNearbyArea({required String areaName}) async {
    triggeredLoading();

    listMap = await api.getNearestArea(
        longitude: defaultPosition!.longitude, latitude: defaultPosition!.latitude, areaName: areaName);

    listMap.forEach((map) {
      markers.add(Marker(markerId: MarkerId(map.placeId), position: LatLng(map.latitude, map.longitude)));
    });

    // for (int i=1; i<=listMap.length; i++) {
    //   markers.add(Marker(markerId: MarkerId('i'), position: LatLng(-0.0729693, 109.391280918)));
    // }

    triggeredLoading();
    update();
  }

  Future<void> getAddress() async {
    print("-------------------");
    print(markers.runtimeType);
    print("-------------------");
    placeAddress = await placemarkFromCoordinates(defaultPosition!.latitude, defaultPosition!.longitude);
  }

  convertMarkers() {

  }

  void triggeredLoading() {
    isLoading =! isLoading;
    update();
  }

}
