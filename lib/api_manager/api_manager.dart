import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ept_mate/model/CategoryModel.dart';
import 'package:ept_mate/model/PlacesModel.dart';
import '../model/CityAfterEdit.dart';
import '../model/PlaceByModelId.dart';

class ApiManger {

  static Future<CityAfterEdit?> getData() async {
    Dio dio = Dio();
    String url =
        'https://mazenhussein-001-site1.jtempurl.com/api/CityCategory/GetAll';
    dio.options.headers = {
      'Authorization':
          'bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiI4ZGFiYzljMy0zNmQxLTQyM2QtOTRhNC02OTJjMjY3ZTBiYTciLCJuYmYiOjE3MTA2MTE2NDUsImV4cCI6MTcxMDYyMjQ0NSwiaWF0IjoxNzEwNjExNjQ1LCJpc3MiOiJFR3lwdFRvdXJNYXRlQXBpIiwiYXVkIjoiU2VjdXJlQXBpVXNlciJ9.Z3r2nBEmbluX3IpRZuIBF9B1Hg2fotZkqB9h6je7tkA'
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
          'bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiI4ZGFiYzljMy0zNmQxLTQyM2QtOTRhNC02OTJjMjY3ZTBiYTciLCJuYmYiOjE3MTA2MTE2NDUsImV4cCI6MTcxMDYyMjQ0NSwiaWF0IjoxNzEwNjExNjQ1LCJpc3MiOiJFR3lwdFRvdXJNYXRlQXBpIiwiYXVkIjoiU2VjdXJlQXBpVXNlciJ9.Z3r2nBEmbluX3IpRZuIBF9B1Hg2fotZkqB9h6je7tkA'
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
          'bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiI4ZGFiYzljMy0zNmQxLTQyM2QtOTRhNC02OTJjMjY3ZTBiYTciLCJuYmYiOjE3MTA2MTE2NDUsImV4cCI6MTcxMDYyMjQ0NSwiaWF0IjoxNzEwNjExNjQ1LCJpc3MiOiJFR3lwdFRvdXJNYXRlQXBpIiwiYXVkIjoiU2VjdXJlQXBpVXNlciJ9.Z3r2nBEmbluX3IpRZuIBF9B1Hg2fotZkqB9h6je7tkA'
    };
    var response = await dio.get(url);
    var city = PlacesModel.fromJson(response.data);
    return city;
  }
  static String url =
      'https://mazenhussein-001-site1.jtempurl.com/';
  static Future<PlacesModel?> getPlaceById({ required String categoryId, required String cityId} ) async {
    BaseOptions options=BaseOptions(baseUrl: url,contentType: 'application/json',
      receiveDataWhenStatusError: true, );
    Dio dio = Dio(options);
    dio.options.headers = {
      'Authorization':
      'bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiI4ZGFiYzljMy0zNmQxLTQyM2QtOTRhNC02OTJjMjY3ZTBiYTciLCJuYmYiOjE3MTA2MTE2NDUsImV4cCI6MTcxMDYyMjQ0NSwiaWF0IjoxNzEwNjExNjQ1LCJpc3MiOiJFR3lwdFRvdXJNYXRlQXBpIiwiYXVkIjoiU2VjdXJlQXBpVXNlciJ9.Z3r2nBEmbluX3IpRZuIBF9B1Hg2fotZkqB9h6je7tkA'
    };
    print(categoryId);
    print(cityId);

    var response = await dio.get("api/Places/GetByCategoryAndCity?categoryId=${categoryId}&cityId=${cityId}");
    print("2222222222");
    print(response);
    var  place = PlacesModel.fromJson(jsonDecode(response.data)) ;
  print("###########");
  print(place);
    return place;
  }

  }

