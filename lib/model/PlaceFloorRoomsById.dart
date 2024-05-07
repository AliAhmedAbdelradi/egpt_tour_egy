class PlaceFloorRoomsById {
  PlaceFloorRoomsById({
    this.success,
    this.message,
    this.data,
    this.status,
  });

  PlaceFloorRoomsById.fromJson(dynamic json) {
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
    this.placeFloorId,
    this.number,
    this.name,
    this.imageLink,
    this.id,
  });

  Data.fromJson(dynamic json) {
    placeFloorId = json['placeFloorId'];
    number = json['number'];
    name = json['name'];
    imageLink = json['imageLink'];
    id = json['id'];
  }

  int? placeFloorId;
  int? number;
  String? name;
  String? imageLink;
  int? id;
}
