class CityAfterEdit {
  CityAfterEdit({
      this.success, 
      this.message, 
      this.data, 
      this.status,});

  CityAfterEdit.fromJson(dynamic json) {
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
      this.imageLink,
      this.id,});

  Data.fromJson(dynamic json) {
    name = json['name'];
    description = json['description'];
    placesCounter = json['placesCounter'];
    imageLink = json['imageLink'];
    id = json['id'];
  }
  String? name;
  String? description;
  int? placesCounter;
  String? imageLink;
  int? id;



}