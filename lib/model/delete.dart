class Delete {
  Delete({
      this.success, 
      this.message, 
      this.data, 
      this.status,});

  Delete.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    data = json['data'];
    status = json['status'];
  }
  bool? success;
  String? message;
  dynamic data;
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