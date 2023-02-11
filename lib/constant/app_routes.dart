import 'package:get/get.dart';
import 'package:nearest/modules/map/map_screen.dart';

class AppRoutes {
  static String map = '/map';
}

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.map, page: () => MapScreen()),
  ];
}
