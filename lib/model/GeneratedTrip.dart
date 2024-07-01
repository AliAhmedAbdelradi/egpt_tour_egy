class GeneratedTrip {
  GeneratedTrip({
      this.success, 
      this.message, 
      this.data, 
      this.status,});

  GeneratedTrip.fromJson(dynamic json) {
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

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    return map;
  }

}

class Data {
  Data({
      this.tripName, 
      this.placeID, 
      this.placeName, 
      this.placeImage, 
      this.cityName, 
      this.cityImage, 
      this.placeRate,});

  Data.fromJson(dynamic json) {
    tripName = json['tripName'];
    placeID = json['placeID'];
    placeName = json['placeName'];
    placeImage = json['placeImage'];
    cityName = json['cityName'];
    cityImage = json['cityImage'];
    placeRate = json['placeRate'];
  }
  String? tripName;
  int? placeID;
  String? placeName;
  String? placeImage;
  String? cityName;
  String? cityImage;
  dynamic placeRate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tripName'] = tripName;
    map['placeID'] = placeID;
    map['placeName'] = placeName;
    map['placeImage'] = placeImage;
    map['cityName'] = cityName;
    map['cityImage'] = cityImage;
    map['placeRate'] = placeRate;
    return map;
  }

}