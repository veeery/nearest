// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nearest/constant/app_size_utils.dart';
import 'package:nearest/modules/map/map_viewmodel.dart';
import 'package:nearest/widgets/app_button.dart';
import 'package:nearest/widgets/app_loading.dart';

import 'map_address.dart';

class MapScreen extends StatelessWidget {
  final MapViewModel controller = Get.put(MapViewModel());

  @override
  Widget build(BuildContext context) {
    AppSizeUtil.init(context: context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          width: 100.w,
          height: 100.h,
          color: Colors.white,
          child: Stack(
            children: [
              GetBuilder<MapViewModel>(
                builder: (_) {
                  if (!controller.statusPermission) return MapError();
                  return MapView();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget MapView() {
    return SizedBox(
      width: 100.w,
      height: 100.h,
      child: Stack(
        children: [
          GoogleMap(
            markers: controller.markers,
            mapType: MapType.normal,
            myLocationEnabled: true,
            initialCameraPosition: CameraPosition(
                target: LatLng(controller.defaultPosition!.latitude, controller.defaultPosition!.longitude),
                zoom: 14.476),
            onMapCreated: (GoogleMapController googleController) {
              controller.googleMapController.complete(googleController);
            },
          ),
          Positioned(
            top: 1.4.h,
            left: 2.w,
            child: AppButton(
              title: "Hospital",
              onTap: () async => await controller.getNearbyArea(areaName: "hospital"),
            ),
          ),
          Positioned(
            top: 1.4.h,
            left: 25.w,
            child: AppButton(
              title: "Restaurant",
              onTap: () async => await controller.getNearbyArea(areaName: "restaurant"),
            ),
          ),
          Positioned(
            bottom: 2.1.h,
            left: 2.w,
            child: MapAddress(),
          ),
          controller.isLoading ? const AppLoading() : Container(),
        ],
      ),
    );
  }

  Widget MapError() {
    return SizedBox(
      width: 100.w,
      height: 100.h,
      child: controller.defaultPosition == null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('You Location Permission is Denied'),
                SizedBox(height: 2.h),
                AppButton(width: 50.w,title: "Get Permission", onTap: () async => await controller.getCurrentLocation())
              ],
            )
          : Container(),
    );
  }
}
