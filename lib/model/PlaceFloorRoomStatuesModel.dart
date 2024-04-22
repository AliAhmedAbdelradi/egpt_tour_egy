class PlaceFloorRoomStatuesModel {
  PlaceFloorRoomStatuesModel({
      this.success, 
      this.message, 
      this.data, 
      this.status,});

  PlaceFloorRoomStatuesModel.fromJson(dynamic json) {
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
      this.roomId, 
      this.name, 
      this.description, 
      this.number, 
      this.locationInRoom, 
      this.imageLink, 
      this.id,});

  Data.fromJson(dynamic json) {
    roomId = json['roomId'];
    name = json['name'];
    description = json['description'];
    number = json['number'];
    locationInRoom = json['locationInRoom'];
    imageLink = json['imageLink'];
    id = json['id'];
  }
  int? roomId;
  String? name;
  String? description;
  int? number;
  String? locationInRoom;
  String? imageLink;
  int? id;



}