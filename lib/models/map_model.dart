class MapModel {
  int id;
  String name;
  String address;
  int capacity;
  String city;
  double latitude;
  double longitude;
  String zip;

  MapModel(
      {required this.id,
      required this.city,
      required this.name,
      required this.longitude,
      required this.latitude,
      required this.address,
      required this.capacity,
      required this.zip});

  factory MapModel.fromJson(Map<String, dynamic> json) {
    return MapModel(
        id: json['id'],
        city: json['city'],
        name: json['name'],
        longitude: json['longitude'],
        latitude: json['latitude'],
        address: json['address'],
        capacity: json['capacity'],
        zip: json['zip']
    );
  }
}
