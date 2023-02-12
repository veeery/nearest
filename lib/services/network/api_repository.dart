import 'package:dio/dio.dart';
import 'package:nearest/services/network/app_dio.dart';

class ApiRepository {
  // https://maps.googleapis.com/maps/api/place/nearbysearch/output?parameters
  // place/nearbysearch/json?location=$latitude,$longitude&radius=1000&type=hospital&key=AIzaSyAa7nXUgjfISG8Ri8r1TI93FN_c_2lRvtM
  // Get Nearest Area
  Future getNearestArea({required double longitude, required double latitude, required String areaName}) async {
    bool result = await AppDio.executeApiWithTryCatch(() async {
      Response response = await AppDio.dio().get(
        "search?key=AIzaSyAa7nXUgjfISG8Ri8r1TI93FN_c_2lRvtM&q=restaurant"
        // "place/nearbysearch/json?location=$latitude,$longitude&radius=1000&type=hospital&key=AIzaSyANT_5TB81vo0GY9ChpqHkzL0bvjZoPCok"
        //   "place/maestro/json?location=$latitude,$longitude&key=AIzaSyAa7nXUgjfISG8Ri8r1TI93FN_c_2lRvtM"
      );
      print(response.data);
    });
  }
}
