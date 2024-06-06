class FastTripPlan {
  FastTripPlan({
    this.success,
    this.message,
    this.data,
    this.status,
  });

  FastTripPlan.fromJson(dynamic json) {
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
    this.name,
    this.duration,
    this.details,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    duration = json['duration'];
    if (json['details'] != null) {
      details = [];
      json['details'].forEach((v) {
        details?.add(Details.fromJson(v));
      });
    }
  }

  int? id;
  String? name;
  int? duration;
  List<Details>? details;
}

class Details {
  Details({
    this.name,
    this.imageLink,
    this.categoryName,
    this.categoryImage,
    this.cityName,
    this.cityImage,
    this.dayNum,
  });

  Details.fromJson(dynamic json) {
    name = json['name'];
    imageLink = json['imageLink'];
    categoryName = json['categoryName'];
    categoryImage = json['categoryImage'];
    cityName = json['cityName'];
    cityImage = json['cityImage'];
    dayNum = json['dayNum'];
  }

  String? name;
  String? imageLink;
  String? categoryName;
  String? categoryImage;
  String? cityName;
  String? cityImage;
  int? dayNum;
}
