class ReadyTripDetalis {
  ReadyTripDetalis({
    this.success,
    this.message,
    this.data,
    this.status,
  });

  ReadyTripDetalis.fromJson(dynamic json) {
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
    this.readyTripId,
    this.placeId,
    this.dayNum,
    this.id,
  });

  Data.fromJson(dynamic json) {
    readyTripId = json['readyTripId'];
    placeId = json['placeId'];
    dayNum = json['dayNum'];
    id = json['id'];
  }

  int? readyTripId;
  int? placeId;
  int? dayNum;
  int? id;
}
