import 'package:dio/dio.dart';
import 'package:ept_mate/model/CategoryModel.dart';
import 'package:ept_mate/model/trip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/CityAfterEdit.dart';
import '../model/PlaceFloorRoomStatuesModel.dart';
import '../model/PlaceFloorRoomsStatusAfter.dart';
import '../model/PlaceModel.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../model/ReadyMadeModel3.dart'; // Import PrettyDioLogger

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

  static Future<ReadyMadeModel3?> getReady() async {
    Dio dio = Dio();
    String url =
        'https://egypttourmate-001-site1.etempurl.com/api/ReadyTrips/GetTrips';
    String? token = await getToken(); // Get token asynchronously
    if (token != null) {
      dio.options.headers = {'Authorization': 'bearer $token'};
    }

    var response = await dio.get(url);
    var ready = ReadyMadeModel3.fromJson(response.data);
    return ready;
  }

  static String url = 'https://egypttourmate-001-site1.etempurl.com/';

  static Future<PlaceModel?> getPlaceById({
    required String categoryId,
    required String cityId,
  }) async {
    Dio dio = Dio();
    String url = 'https://egypttourmate-001-site1.etempurl.com';
    String? token = await getToken(); // Get token asynchronously
    if (token != null) {
      dio.options.headers = {'Authorization': 'bearer $token'};
    }

    var response = await dio.get(
        "$url/api/Places/GetByCategoryAndCity?categoryId=$categoryId&cityId=$cityId");
    var place = PlaceModel.fromJson(response.data);
    return place;
  }

  static Future<PlaceFloorRoomStatuesModel?> getFloorDetails() async {
    Dio dio = Dio();
    String url =
        'https://egypttourmate-001-site1.etempurl.com/api/PlaceFloorRooms/GetAll';
    String? token = await getToken(); // Get token asynchronously
    if (token != null) {
      dio.options.headers = {'Authorization': 'bearer $token'};
    }
    var response = await dio.get(url);
    var Floor = PlaceFloorRoomStatuesModel.fromJson(response.data);
    return Floor;
  }

  static Future<PlaceFloorRoomsStatusAfter?> getPlaceFloorRoomStatues() async {
    Dio dio = Dio();
    String url =
        'https://egypttourmate-001-site1.etempurl.com/api/PlaceFloorRoomStatues/GetAll';
    String? token = await getToken(); // Get token asynchronously
    if (token != null) {
      dio.options.headers = {'Authorization': 'bearer $token'};
    }
    var response = await dio.get(url);
    var statues = PlaceFloorRoomsStatusAfter.fromJson(response.data);
    return statues;
  }

  static Future<void> addTrip(Trip trip) async {
    trip.nameOfTrip="TEST";
    print(trip.toJson());
    Dio dio = Dio();
    String url =
        'https://egypttourmate-001-site1.etempurl.com/api/UserTrips/Add';
    String? token = await getToken(); // Get token asynchronously
    if (token != null) {
      dio.options.headers = {'Authorization': 'bearer $token'};
    }
    try{
      var response = await dio.post(url,data:FormData.fromMap(trip.toJson()));
      print(response.data);
    }
    catch(e){
      print(e);

    }
  }
  static Future<PlaceModel?> getplaceByCityId({
    required String cityId,
  }) async {
    Dio dio = Dio();
    String url = 'https://egypttourmate-001-site1.etempurl.com';
    String? token = await getToken(); // Get token asynchronously
    if (token != null) {
      dio.options.headers = {'Authorization': 'bearer $token'};
    }
    var response = await dio.get(
        "$url/api/Places/GetByCity?cityId=$cityId");
    var place = PlaceModel.fromJson(response.data);
    return place;
  }
}
