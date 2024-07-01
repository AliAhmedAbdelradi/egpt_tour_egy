class Generated {
  Generated({
      this.success, 
      this.message, 
      this.data, 
      this.status,});

  Generated.fromJson(dynamic json) {
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
      this.cityID, 
      this.cityName, 
      this.cityImage, 
      this.places,});

  Data.fromJson(dynamic json) {
    cityID = json['cityID'];
    cityName = json['cityName'];
    cityImage = json['cityImage'];
    if (json['places'] != null) {
      places = [];
      json['places'].forEach((v) {
        places?.add(Places.fromJson(v));
      });
    }
  }
  int? cityID;
  String? cityName;
  String? cityImage;
  List<Places>? places;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cityID'] = cityID;
    map['cityName'] = cityName;
    map['cityImage'] = cityImage;
    if (places != null) {
      map['places'] = places?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Places {
  Places({
      this.tripName, 
      this.placeID, 
      this.placeName, 
      this.placeImage, 
      this.placeRate,});

  Places.fromJson(dynamic json) {
    tripName = json['tripName'];
    placeID = json['placeID'];
    placeName = json['placeName'];
    placeImage = json['placeImage'];
    placeRate = json['placeRate'];
  }
  String? tripName;
  int? placeID;
  String? placeName;
  String? placeImage;
  dynamic placeRate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tripName'] = tripName;
    map['placeID'] = placeID;
    map['placeName'] = placeName;
    map['placeImage'] = placeImage;
    map['placeRate'] = placeRate;
    return map;
  }

}