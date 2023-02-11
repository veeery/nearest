import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nearest/constant/app_size_utils.dart';
import 'map_viewmodel.dart';

class MapWidget extends StatelessWidget {
  final MapViewModel controller = Get.find<MapViewModel>();

  MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizeUtil.init(context: context);

    return SizedBox(
      width: 100.w,
      height: 100.h,
      child: controller.defaultPosition != null
          ? GoogleMap(
              markers: controller.markers,
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              initialCameraPosition: CameraPosition(
                  target: LatLng(controller.defaultPosition!.latitude, controller.defaultPosition!.longitude),
                  zoom: 14.476))
          : const Center(child: Text('You Location Permission is Denied')),
    );
  }
}
