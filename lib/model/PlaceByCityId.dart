class PlaceByCityId {
  PlaceByCityId({
    this.success,
    this.message,
    this.data,
    this.status,});

  PlaceByCityId.fromJson(dynamic json) {
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



}