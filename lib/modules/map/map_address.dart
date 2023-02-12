import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nearest/constant/app_size_utils.dart';
import 'package:nearest/constant/app_text_style.dart';
import 'package:nearest/constant/app_curve_size.dart';
import 'package:nearest/modules/map/map_viewmodel.dart';

class MapAddress extends StatelessWidget {
  final MapViewModel controller = Get.find<MapViewModel>();

  @override
  Widget build(BuildContext context) {
    AppSizeUtil.init(context: context);

    return GestureDetector(
      onTap: () async {
        final GoogleMapController cameraPosition = await controller.googleMapController.future;
        cameraPosition.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
            target: LatLng(controller.defaultPosition!.latitude, controller.defaultPosition!.longitude),
            zoom: 14.476)));
      },
      child: Container(
        width: 82.w,
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.circular(AppCurveSize.smallCurve),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${controller.placeAddress[0].thoroughfare}', style: AppTextStyle.mediumText),
            Text('${controller.placeAddress[0].subLocality}, ${controller.placeAddress[0].postalCode}',
                style: AppTextStyle.normalText),
            Text('${controller.placeAddress[0].locality}', style: AppTextStyle.normalText),
            Text('${controller.placeAddress[0].subAdministrativeArea}', style: AppTextStyle.normalText),
            Text('${controller.placeAddress[0].administrativeArea}, ${controller.placeAddress[0].country}',
                style: AppTextStyle.normalText),
          ],
        ),
      ),
    );
  }
}
