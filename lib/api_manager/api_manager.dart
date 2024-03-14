import 'package:dio/dio.dart';
import 'package:ept_mate/model/CategoryModel.dart';

import 'package:ept_mate/model/PlacesModel.dart';

import '../model/CityAfterEdit.dart';

class ApiManger {
  static Future<CityAfterEdit?> getData() async {
    Dio dio = Dio();
    String url =
        'https://mazenhussein-001-site1.jtempurl.com/api/CityCategory/GetAll';
    dio.options.headers = {
      'Authorization':
          'bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiI4ZGFiYzljMy0zNmQxLTQyM2QtOTRhNC02OTJjMjY3ZTBiYTciLCJuYmYiOjE3MTA0Mjc1OTEsImV4cCI6MTcxMDQzODM5MSwiaWF0IjoxNzEwNDI3NTkxLCJpc3MiOiJFR3lwdFRvdXJNYXRlQXBpIiwiYXVkIjoiU2VjdXJlQXBpVXNlciJ9.DRnz6TLGOAXEPTS0cMQbYBC0CAhtv3J2xjwlhhwkCrc'
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
          'bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiI4ZGFiYzljMy0zNmQxLTQyM2QtOTRhNC02OTJjMjY3ZTBiYTciLCJuYmYiOjE3MTA0Mjc1OTEsImV4cCI6MTcxMDQzODM5MSwiaWF0IjoxNzEwNDI3NTkxLCJpc3MiOiJFR3lwdFRvdXJNYXRlQXBpIiwiYXVkIjoiU2VjdXJlQXBpVXNlciJ9.DRnz6TLGOAXEPTS0cMQbYBC0CAhtv3J2xjwlhhwkCrc'
    };
    var response = await dio.get(url);
    var category = CategoryModel.fromJson(response.data);
    return category;
  }

  static Future<PlacesModel?> getPlaces() async {
    Dio dio = Dio();
    String url =
        'https://mazenhussein-001-site1.jtempurl.com/api/Places/GetAll';
    dio.options.headers = {
      'Authorization':
          'bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiI4ZGFiYzljMy0zNmQxLTQyM2QtOTRhNC02OTJjMjY3ZTBiYTciLCJuYmYiOjE3MTA0Mjc1OTEsImV4cCI6MTcxMDQzODM5MSwiaWF0IjoxNzEwNDI3NTkxLCJpc3MiOiJFR3lwdFRvdXJNYXRlQXBpIiwiYXVkIjoiU2VjdXJlQXBpVXNlciJ9.DRnz6TLGOAXEPTS0cMQbYBC0CAhtv3J2xjwlhhwkCrc'
    };
    var response = await dio.get(url);
    var category = PlacesModel.fromJson(response.data);
    return category;
  }
}
