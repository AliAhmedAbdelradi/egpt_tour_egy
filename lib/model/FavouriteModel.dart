class FavouriteModel {
  FavouriteModel({
      this.success, 
      this.message, 
      this.data, 
      this.status, required String placeId,});

  FavouriteModel.fromJson(dynamic json) {
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
      this.id, 
      this.placeId, 
      this.name, 
      this.description, 
      this.imageLink, 
      this.cityId, 
      this.categoryId, 
      this.rateCount, 
      this.rate,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    placeId = json['placeId'];
    name = json['name'];
    description = json['description'];
    imageLink = json['imageLink'];
    cityId = json['cityId'];
    categoryId = json['categoryId'];
    rateCount = json['rateCount'];
    rate = json['rate'];
  }
  int? id;
  int? placeId;
  String? name;
  String? description;
  String? imageLink;
  int? cityId;
  int? categoryId;
  dynamic rateCount;
  dynamic rate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['placeId'] = placeId;
    map['name'] = name;
    map['description'] = description;
    map['imageLink'] = imageLink;
    map['cityId'] = cityId;
    map['categoryId'] = categoryId;
    map['rateCount'] = rateCount;
    map['rate'] = rate;
    return map;
  }

}