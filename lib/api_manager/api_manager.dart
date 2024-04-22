import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ept_mate/model/CategoryModel.dart';
import '../model/CityAfterEdit.dart';
import '../model/CustomizePlaces.dart';
import '../model/PlaceModel.dart';

class ApiManger {
  static String Authorization =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiI4ZGFiYzljMy0zNmQxLTQyM2QtOTRhNC02OTJjMjY3ZTBiYTciLCJVc2VySUQiOiI4ZGFiYzljMy0zNmQxLTQyM2QtOTRhNC02OTJjMjY3ZTBiYTciLCJuYmYiOjE3MTM4MDE2NzksImV4cCI6MTcxMzgxMjQ3OSwiaWF0IjoxNzEzODAxNjc5LCJpc3MiOiJFR3lwdFRvdXJNYXRlQXBpIiwiYXVkIjoiU2VjdXJlQXBpVXNlciJ9.upuUmoZqQ57QGnqu52IQcOkem2Sb1zmLyO0I-8DUaJc';
  static Future<CityAfterEdit?> getData() async {
    Dio dio = Dio();
    String url =
        'https://egypttourmate-001-site1.etempurl.com/api/CityCategory/GetAll';
    dio.options.headers = {'Authorization': 'bearerey $Authorization'};
    var response = await dio.get(url);
    var data = CityAfterEdit.fromJson(response.data);
    return data;
  }

  static Future<CategoryModel?> getCategory() async {
    Dio dio = Dio();
    String url =
        'https://egypttourmate-001-site1.etempurl.com/api/TourismCategories/GetAll';
    dio.options.headers = {'Authorization': 'bearer $Authorization'};
    var response = await dio.get(url);
    var category = CategoryModel.fromJson(response.data);
    return category;
  }

  static Future<CityAfterEdit?> getCity() async {
    Dio dio = Dio();
    String url =
        'https://egypttourmate-001-site1.etempurl.com/api/CityCategory/GetAll';
    dio.options.headers = {'Authorization': 'bearer $Authorization'};
    var response = await dio.get(url);
    var city = CityAfterEdit.fromJson(response.data);
    return city;
  }

  static String url = 'https://egypttourmate-001-site1.etempurl.com/';

  static Future<PlaceModel?> getPlaceById(
      {required String categoryId, required String cityId}) async {
    BaseOptions options = BaseOptions(
      baseUrl: url,
      contentType: 'application/json',
      receiveDataWhenStatusError: true,
    );
    Dio dio = Dio(options);

    dio.options.headers = {'Authorization': 'bearer $Authorization'};
    print(categoryId);
    print(cityId);

    var response = await dio.get(
        "api/Places/GetByCategoryAndCity?categoryId=${categoryId}&cityId=${cityId}");

    print("2222222222");
    print(response);
    var place = PlaceModel.fromJson(jsonDecode(response.data["data"]));
    print(place);

    print("###########");
    print(place);
    return place;
  }
}
