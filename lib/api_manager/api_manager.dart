import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ept_mate/model/CategoryModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/CityAfterEdit.dart';
import '../model/CustomizePlaces.dart';
import '../model/PlaceModel.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart'; // Import PrettyDioLogger

class ApiManager {
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(
        'token'); // Assuming 'token' is the key for your token in SharedPreferences
  }

  static Future<CityAfterEdit?> getData() async {
    Dio dio = Dio();
    String url =
        'https://egypttourmate-001-site1.etempurl.com/api/CityCategory/GetAll';
    String? token = await getToken(); // Get token asynchronously
    if (token != null) {
      dio.options.headers = {'Authorization': 'bearer $token'};
    }
    dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );

    var response = await dio.get(url);
    var data = CityAfterEdit.fromJson(response.data);
    return data;
  }

  static Future<CategoryModel?> getCategory() async {
    Dio dio = Dio();
    String url =
        'https://egypttourmate-001-site1.etempurl.com/api/TourismCategories/GetAll';
    String? token = await getToken(); // Get token asynchronously
    if (token != null) {
      dio.options.headers = {'Authorization': 'bearer $token'};
    }

    var response = await dio.get(url);
    var category = CategoryModel.fromJson(response.data);
    return category;
  }

  static Future<CityAfterEdit?> getCity() async {
    Dio dio = Dio();
    String url =
        'https://egypttourmate-001-site1.etempurl.com/api/CityCategory/GetAll';
    String? token = await getToken(); // Get token asynchronously
    if (token != null) {
      dio.options.headers = {'Authorization': 'bearer $token'};
    }

    var response = await dio.get(url);
    var city = CityAfterEdit.fromJson(response.data);
    return city;
  }

  static String url = 'https://egypttourmate-001-site1.etempurl.com/';

  static Future<PlaceModel?> getPlaceById({
    required String categoryId,
    required String cityId,
  }) async {
    Dio dio = Dio();
    String url = 'https://egypttourmate-001-site1.etempurl.com/';
    String? token = await getToken(); // Get token asynchronously
    if (token != null) {
      dio.options.headers = {'Authorization': 'bearer $token'};
    }

    var response = await dio.get(
        "$url/api/Places/GetByCategoryAndCity?categoryId=$categoryId&cityId=$cityId");

    var place = PlaceModel.fromJson(jsonDecode(response.data["data"]));
    return place;
  }
}
