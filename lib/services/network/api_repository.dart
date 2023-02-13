import 'package:dio/dio.dart';
import 'package:nearest/services/network/app_dio.dart';

class ApiRepository {
  // Get Nearest Area
  Future getNearestArea(
      {required double longitude, required double latitude, required String areaName, double radius = 5000}) async {
    await AppDio.executeApiWithTryCatch(() async {
      Response response = await AppDio.dio().get(
          "place/nearbysearch/json?location=$latitude,$longitude&radius=$radius&type=$areaName&key=AIzaSyANT_5TB81vo0GY9ChpqHkzL0bvjZoPCok");




    });
  }
}
