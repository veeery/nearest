import 'package:get/get.dart';
import 'package:nearest/modules/home/home_screen.dart';

class AppRoutes {
  static String home = '/home';
}

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.home, page: () => HomeScreen()),
  ];
}