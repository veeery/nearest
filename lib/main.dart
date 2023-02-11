import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nearest/constant/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: GetMaterialApp(
        theme: ThemeData(fontFamily: "Poppins"),
        initialRoute: AppRoutes.map,
        getPages: AppPages.pages,
      ),
    );
  }
}
