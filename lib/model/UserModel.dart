class UserModel {
  UserModel({
    this.success,
    this.message,
    this.isAuthenticated,
    this.username,
    this.email,
    this.roles,
    this.token,
    this.status,
  });

  UserModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    isAuthenticated = json['isAuthenticated'];
    username = json['username'];
    email = json['email'];
    roles = json['roles'] != null ? json['roles'].cast<String>() : [];
    token = json['token'];
    status = json['status'];
  }

  bool? success;
  dynamic message;
  bool? isAuthenticated;
  String? username;
  String? email;
  List<String>? roles;
  String? token;
  int? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    map['isAuthenticated'] = isAuthenticated;
    map['username'] = username;
    map['email'] = email;
    map['roles'] = roles;
    map['token'] = token;
    map['status'] = status;
    return map;
  }
}
