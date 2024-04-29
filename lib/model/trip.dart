class Trip {
  String ?nameOfTrip="";
  DateTime ?startDate=DateTime.now();
  DateTime ?endDate=DateTime.now();
  List<int>? placesID=[];
  List<int>? dayNums=[];
  List<int>? typeID=[];
  List<String>? cityName=[];
  List<String>? images=[];
  Trip({
     this.nameOfTrip,
    this.startDate,
    this.endDate,
    this.placesID,
    this.dayNums,
    this.typeID,
    this.cityName,

  });

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      nameOfTrip: json['nameOfTrip'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      placesID: List<int>.from(json['placesID']),
      dayNums: List<int>.from(json['dayNums']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nameOfTrip'] = this.nameOfTrip;
    data['startDate'] = this.startDate!.toIso8601String();
    data['endDate'] = this.endDate!.toIso8601String();
    data['placesID'] = this.placesID;
    data['dayNums'] = this.dayNums;
    return data;
  }
}
