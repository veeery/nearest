import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nearest/constant/app_size_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppSizeUtil.init(context: context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          width: 100.w,
          height: 100.h,
          color: Colors.red,
          child: Column(
            children: [
              Container(
                width: 50.w,
                height: 50.h,
                child: GoogleMap(
                    initialCameraPosition:
                        CameraPosition(target: LatLng(37.42796133580664, -122.085749655962), zoom: 14.476)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
