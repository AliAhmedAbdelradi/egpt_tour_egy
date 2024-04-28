class ReadymadeModel {
  ReadymadeModel({
    required this.success,
    required this.message,
    required this.data,
    required this.status,
  });
  late final bool success;
  late final String message;
  late final List<Data> data;
  late final int status;

  ReadymadeModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    status = json['status'];
  }

}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.duration,
    required this.placeName,
    required this.imageLink,
    required this.cityName,
    required this.dayNumber,
  });
  late final int id;
  late final String name;
  late final int duration;
  late final String placeName;
  late final String imageLink;
  late final String cityName;
  late final int dayNumber;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    duration = json['duration'];
    placeName = json['placeName'];
    imageLink = json['imageLink'];
    cityName = json['cityName'];
    dayNumber = json['dayNumber'];
  }


}