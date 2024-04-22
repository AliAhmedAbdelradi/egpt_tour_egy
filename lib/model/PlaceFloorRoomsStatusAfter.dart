class PlaceFloorRoomsStatusAfter {
  PlaceFloorRoomsStatusAfter({
      this.success, 
      this.message, 
      this.data, 
      this.status,});

  PlaceFloorRoomsStatusAfter.fromJson(dynamic json) {
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
      this.period, 
      this.dynasty, 
      this.height, 
      this.placeOfDiscovery, 
      this.material, 
      this.description, 
      this.number, 
      this.locationInRoom, 
      this.imageLink, 
      this.id,});

  Data.fromJson(dynamic json) {
    roomId = json['roomId'];
    name = json['name'];
    period = json['period'];
    dynasty = json['dynasty'];
    height = json['height'];
    placeOfDiscovery = json['placeOfDiscovery'];
    material = json['material'];
    description = json['description'];
    number = json['number'];
    locationInRoom = json['locationInRoom'];
    imageLink = json['imageLink'];
    id = json['id'];
  }
  int? roomId;
  String? name;
  String? period;
  String? dynasty;
  String? height;
  String? placeOfDiscovery;
  String? material;
  dynamic description;
  int? number;
  String? locationInRoom;
  String? imageLink;
  int? id;



}