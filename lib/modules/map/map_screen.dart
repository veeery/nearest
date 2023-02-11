import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nearest/constant/app_size_utils.dart';
import 'package:nearest/modules/map/map_viewmodel.dart';
import 'package:nearest/modules/map/map_widget.dart';
import 'package:nearest/widgets/app_button.dart';

class MapScreen extends StatelessWidget {
  final MapViewModel controller = Get.put(MapViewModel());

  @override
  Widget build(BuildContext context) {
    AppSizeUtil.init(context: context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          width: 100.w,
          height: 100.h,
          color: Colors.white,
          child: GetBuilder<MapViewModel>(
            builder: (_) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  MapWidget(),
                  Positioned(
                    bottom: 5.h,
                    child: AppButton(
                        title: "Get Current Location",
                        onTap: () async {
                          await controller.getCurrentLocation();
                        }),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
