class PlaceDetailsByPlaceId {
  PlaceDetailsByPlaceId({
    this.success,
    this.message,
    this.data,
    this.status,
  });

  PlaceDetailsByPlaceId.fromJson(dynamic json) {
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
    this.id,
    this.placeId,
    this.placeName,
    this.placeImages,
    this.detailedDescription,
    this.openTime,
    this.closeTime,
    this.longitude,
    this.latitude,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    placeId = json['placeId'];
    placeName = json['placeName'];
    placeImages =
        json['placeImages'] != null ? json['placeImages'].cast<String>() : [];
    detailedDescription = json['detailedDescription'];
    openTime = json['openTime'];
    closeTime = json['closeTime'];
    longitude = json['longitude'];
    latitude = json['latitude'];
  }

  int? id;
  int? placeId;
  String? placeName;
  List<String>? placeImages;
  String? detailedDescription;
  String? openTime;
  String? closeTime;
  double? longitude;
  double? latitude;
}
