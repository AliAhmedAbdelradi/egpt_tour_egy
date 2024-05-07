class GetReadyMateById {
  GetReadyMateById({
    required this.success,
    required this.message,
    required this.data,
    required this.status,
  });
  late final bool success;
  late final String message;
  late final List<Data> data;
  late final int status;

  GetReadyMateById.fromJson(Map<String, dynamic> json){
    success = json['success'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['status'] = status;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.duration,
    required this.details,
  });
  late final int id;
  late final String name;
  late final int duration;
  late final List<Details> details;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    duration = json['duration'];
    details = List.from(json['details']).map((e)=>Details.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['duration'] = duration;
    _data['details'] = details.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Details {
  Details({
    required this.name,
    required this.imageLink,
    required this.categoryName,
    required this.categoryImage,
    required this.cityName,
    required this.cityImage,
    required this.dayNum,
  });
  late final String name;
  late final String imageLink;
  late final String categoryName;
  late final String categoryImage;
  late final String cityName;
  late final String cityImage;
  late final int dayNum;

  Details.fromJson(Map<String, dynamic> json){
    name = json['name'];
    imageLink = json['imageLink'];
    categoryName = json['categoryName'];
    categoryImage = json['categoryImage'];
    cityName = json['cityName'];
    cityImage = json['cityImage'];
    dayNum = json['dayNum'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['imageLink'] = imageLink;
    _data['categoryName'] = categoryName;
    _data['categoryImage'] = categoryImage;
    _data['cityName'] = cityName;
    _data['cityImage'] = cityImage;
    _data['dayNum'] = dayNum;
    return _data;
  }
}