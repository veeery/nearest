import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewModel extends GetxController {

  Position? defaultPosition;
  late dynamic markers;


  @override
  void onInit() {

    super.onInit();
  }

  Future<bool> getPermission() async {
    // bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return  false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return  false;
    }

    return true;
  }

  Future getCurrentLocation() async {
    bool status = await getPermission();
    if (status) {
      defaultPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      markers = {
        Marker(markerId: MarkerId('$defaultPosition'), position: LatLng(defaultPosition!.latitude, defaultPosition!.longitude))
      };
    } else {
      // return message to open setting;
    }
    update();
  }



}