import 'package:dio/dio.dart';
import 'package:ept_mate/model/CategoryModel.dart';
import 'package:ept_mate/model/GetAllPlaces.dart';
import '../model/CityAfterEdit.dart';

class ApiManger {


  static Future<CityAfterEdit?> getData() async {
    Dio dio = Dio();
    String url =
        'https://mazenhussein-001-site1.jtempurl.com/api/CityCategory/GetAll';
    dio.options.headers = {
      'Authorization':
      'bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiI4ZGFiYzljMy0zNmQxLTQyM2QtOTRhNC02OTJjMjY3ZTBiYTciLCJVc2VySUQiOiI4ZGFiYzljMy0zNmQxLTQyM2QtOTRhNC02OTJjMjY3ZTBiYTciLCJuYmYiOjE3MTA3NzU4NTYsImV4cCI6MTcxMDc4NjY1NiwiaWF0IjoxNzEwNzc1ODU2LCJpc3MiOiJFR3lwdFRvdXJNYXRlQXBpIiwiYXVkIjoiU2VjdXJlQXBpVXNlciJ9.bsRN5CmJGsJ8J1Ucjlzs_b1ZH0VrBciJ_RUPTJSti28'
    };
    var response = await dio.get(url);
    var data = CityAfterEdit.fromJson(response.data);
    return data;
  }

  static Future<CategoryModel?> getCategory() async {
    Dio dio = Dio();
    String url =
        'https://mazenhussein-001-site1.jtempurl.com/api/TourismCategories/GetAll';
    dio.options.headers = {
      'Authorization':
      'bearer  eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiI4ZGFiYzljMy0zNmQxLTQyM2QtOTRhNC02OTJjMjY3ZTBiYTciLCJVc2VySUQiOiI4ZGFiYzljMy0zNmQxLTQyM2QtOTRhNC02OTJjMjY3ZTBiYTciLCJuYmYiOjE3MTA3NzU4NTYsImV4cCI6MTcxMDc4NjY1NiwiaWF0IjoxNzEwNzc1ODU2LCJpc3MiOiJFR3lwdFRvdXJNYXRlQXBpIiwiYXVkIjoiU2VjdXJlQXBpVXNlciJ9.bsRN5CmJGsJ8J1Ucjlzs_b1ZH0VrBciJ_RUPTJSti28'
    };
    var response = await dio.get(url);
    var category = CategoryModel.fromJson(response.data);
    return category;
  }

  static Future<GetAllPlaces?> getPlaces() async {
    Dio dio = Dio();
    String url =
        'https://mazenhussein-001-site1.jtempurl.com/api/Places/GetAll';
    dio.options.headers = {
      'Authorization':
          'bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiI4ZGFiYzljMy0zNmQxLTQyM2QtOTRhNC02OTJjMjY3ZTBiYTciLCJVc2VySUQiOiI4ZGFiYzljMy0zNmQxLTQyM2QtOTRhNC02OTJjMjY3ZTBiYTciLCJuYmYiOjE3MTA3NzU4NTYsImV4cCI6MTcxMDc4NjY1NiwiaWF0IjoxNzEwNzc1ODU2LCJpc3MiOiJFR3lwdFRvdXJNYXRlQXBpIiwiYXVkIjoiU2VjdXJlQXBpVXNlciJ9.bsRN5CmJGsJ8J1Ucjlzs_b1ZH0VrBciJ_RUPTJSti28'
    };
    var response = await dio.get(url);
    var category = GetAllPlaces.fromJson(response.data);
    return category;
  }
}
