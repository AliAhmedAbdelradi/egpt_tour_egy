class PlacesModel {
  PlacesModel({
      this.success, 
      this.message, 
      this.data, 
      this.status,});

  PlacesModel.fromJson(dynamic json) {
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
      this.categoryId, 
      this.cityId, 
      this.name, 
      this.description, 
      this.imageLink, 
      this.rate, 
      this.rateCount, 
      this.id,});

  Data.fromJson(dynamic json) {
    categoryId = json['categoryId'];
    cityId = json['cityId'];
    name = json['name'];
    description = json['description'];
    imageLink = json['imageLink'];
    rate = json['rate'];
    rateCount = json['rateCount'];
    id = json['id'];
  }
  int? categoryId;
  int? cityId;
  String? name;
  String? description;
  String? imageLink;
  int? rate;
  int? rateCount;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['categoryId'] = categoryId;
    map['cityId'] = cityId;
    map['name'] = name;
    map['description'] = description;
    map['imageLink'] = imageLink;
    map['rate'] = rate;
    map['rateCount'] = rateCount;
    map['id'] = id;
    return map;
  }

}