class MapModel {
  String placeId;
  String? name;
  double latitude;
  double longitude;

  MapModel({required this.placeId, this.name, required this.longitude, required this.latitude});

  factory MapModel.fromJson(Map<String, dynamic> json) {
    return MapModel(
      placeId: json['place_id'].toString(),
      name: json['name'] ?? "no name",
      longitude: json['geometry']['lng'],
      latitude: json['geometry']['lat'],
    );
  }
}
