class ReadyMadeModel {
  ReadyMadeModel({
      this.success, 
      this.message, 
      this.data, 
      this.status,});

  ReadyMadeModel.fromJson(dynamic json) {
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
      this.duration, 
      this.countOfPlaces, 
      this.id,});

  Data.fromJson(dynamic json) {
    name = json['name'];
    duration = json['duration'];
    countOfPlaces = json['countOfPlaces'];
    id = json['id'];
  }
  String? name;
  int? duration;
  int? countOfPlaces;
  int? id;



}