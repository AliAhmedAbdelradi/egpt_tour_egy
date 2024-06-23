class UserModel1 {
  UserModel1({
      this.success, 
      this.message, 
      this.isAuthenticated, 
      this.isConfirmed, 
      this.username, 
      this.email, 
      this.roles, 
      this.token, 
      this.status,});

  UserModel1.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    isAuthenticated = json['isAuthenticated'];
    isConfirmed = json['isConfirmed'];
    username = json['username'];
    email = json['email'];
    roles = json['roles'] != null ? json['roles'].cast<String>() : [];
    token = json['token'];
    status = json['status'];
  }
  bool? success;
  dynamic message;
  bool? isAuthenticated;
  bool? isConfirmed;
  String? username;
  String? email;
  List<String>? roles;
  dynamic token;
  int? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    map['isAuthenticated'] = isAuthenticated;
    map['isConfirmed'] = isConfirmed;
    map['username'] = username;
    map['email'] = email;
    map['roles'] = roles;
    map['token'] = token;
    map['status'] = status;
    return map;
  }

}