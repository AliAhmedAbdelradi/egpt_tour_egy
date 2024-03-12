class CityResponse {
  CityResponse({
    this.success,
    this.message,
    this.data,
    this.status,
  });

  CityResponse.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    status = json['status'];
  }

  bool? success;
  String? message;
  List<Data>? data;
  int? status;
}

class Data {
  Data({
    this.name,
    this.description,
    this.placesCounter,
    this.image,
  });

  Data.fromJson(dynamic json) {
    name = json['name'];
    description = json['description'];
    placesCounter = json['placesCounter'];
    image = json['image'];
  }

  String? name;
  String? description;
  int? placesCounter;
  dynamic image;
}
