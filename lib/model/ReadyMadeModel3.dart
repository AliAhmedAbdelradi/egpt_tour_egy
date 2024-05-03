class ReadyMadeModel3 {
  ReadyMadeModel3({
      this.success, 
      this.message, 
      this.data, 
      this.status,});

  ReadyMadeModel3.fromJson(dynamic json) {
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
      this.placeName, 
      this.imageLink, 
      this.categoryName, 
      this.categotyImage, 
      this.cityName, 
      this.cityImage, 
      this.dayNumber,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    duration = json['duration'];
    placeName = json['placeName'];
    imageLink = json['imageLink'];
    categoryName = json['categoryName'];
    categotyImage = json['categotyImage'];
    cityName = json['cityName'];
    cityImage = json['cityImage'];
    dayNumber = json['dayNumber'];
  }
  int? id;
  String? name;
  int? duration;
  String? placeName;
  String? imageLink;
  String? categoryName;
  String? categotyImage;
  String? cityName;
  String? cityImage;
  int? dayNumber;



}