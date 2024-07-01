class AddOrRemoveFavourites {
  AddOrRemoveFavourites({
      this.success, 
      this.message, 
      this.data, 
      this.status,});

  AddOrRemoveFavourites.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? json['data'].cast<int>() : [];
    status = json['status'];
  }
  bool? success;
  String? message;
  List<int>? data;
  int? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    map['data'] = data;
    map['status'] = status;
    return map;
  }

}