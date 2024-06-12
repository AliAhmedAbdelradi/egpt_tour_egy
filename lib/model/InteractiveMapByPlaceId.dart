class InteractiveMapByPlaceId {
  InteractiveMapByPlaceId({
    this.success,
    this.message,
    this.data,
    this.status,
  });

  InteractiveMapByPlaceId.fromJson(dynamic json) {
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
    this.placeDetailsId,
    this.imageLink,
    this.id,
  });

  Data.fromJson(dynamic json) {
    placeDetailsId = json['placeDetailsId'];
    imageLink = json['imageLink'];
    id = json['id'];
  }

  int? placeDetailsId;
  String? imageLink;
  int? id;
}
