class AllPlaces {
  AllPlaces({
    this.success,
    this.message,
    this.data,
    this.status,
  });

  AllPlaces.fromJson(dynamic json) {
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
    this.description,
    this.imageLink,
    this.cityId,
    this.categoryId,
    this.rateCount,
    this.cityName,
    this.categoryName,
    this.rate,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imageLink = json['imageLink'];
    cityId = json['cityId'];
    categoryId = json['categoryId'];
    rateCount = json['rateCount'];
    cityName = json['cityName'];
    categoryName = json['categoryName'];
    rate = json['rate'];
  }

  int? id;
  String? name;
  String? description;
  String? imageLink;
  int? cityId;
  int? categoryId;
  dynamic rateCount;
  String? cityName;
  String? categoryName;
  dynamic rate;
}
