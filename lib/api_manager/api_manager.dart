import 'package:dio/dio.dart';
import 'package:ept_mate/model/CategoryModel.dart';
import 'package:ept_mate/model/GetAllPlaces.dart';
import '../model/CityAfterEdit.dart';
import '../model/FloorDetailsModel.dart';
import '../model/PlaceFloorRoomsStatusAfter.dart';
import '../model/ReadyTripDetalis.dart';

class ApiManger {
  static String _token="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiI4ZGFiYzljMy0zNmQxLTQyM2QtOTRhNC02OTJjMjY3ZTBiYTciLCJVc2VySUQiOiI4ZGFiYzljMy0zNmQxLTQyM2QtOTRhNC02OTJjMjY3ZTBiYTciLCJuYmYiOjE3MTM3OTE5NjAsImV4cCI6MTcxMzgwMjc2MCwiaWF0IjoxNzEzNzkxOTYwLCJpc3MiOiJFR3lwdFRvdXJNYXRlQXBpIiwiYXVkIjoiU2VjdXJlQXBpVXNlciJ9.iTQwYqVgUvGnvfw47arYB4tGmhz_6d9AQHdhAsOTY9U";


  static Future<CityAfterEdit?> getData() async {

    Dio dio = Dio();
    String url =
        'https://egypttourmate-001-site1.etempurl.com/api/CityCategory/GetAll';
    dio.options.headers = {
      'Authorization':
      'bearer $_token'
    };
    var response = await dio.get(url);
    var data = CityAfterEdit.fromJson(response.data);
    return data;
  }

  static Future<CategoryModel?> getCategory() async {
    Dio dio = Dio();
    String url =
        'https://egypttourmate-001-site1.etempurl.com/api/TourismCategories/GetAll';
    dio.options.headers = {
      'Authorization':
      'bearer $_token'
    };
    var response = await dio.get(url);
    var category = CategoryModel.fromJson(response.data);
    return category;
  }

  static Future<GetAllPlaces?> getPlaces() async {
    Dio dio = Dio();
    String url =
        'https://egypttourmate-001-site1.etempurl.com/api/Places/GetAll';
    dio.options.headers = {
      'Authorization':
          'bearer $_token'
    };
    var response = await dio.get(url);
    var category = GetAllPlaces.fromJson(response.data);
    return category;
  }
  static Future<FloorDetailsModel?> getFloorDetails() async {
    Dio dio = Dio();
    String url =
        'https://egypttourmate-001-site1.etempurl.com/api/PlaceFloorRooms/GetAll';
    dio.options.headers = {
      'Authorization':
          'bearer $_token'
    };
    var response = await dio.get(url);
    var Floor = FloorDetailsModel.fromJson(response.data);
    return Floor;
  }
  static Future<PlaceFloorRoomsStatusAfter?> getPlaceFloorRoomStatues() async {
    Dio dio = Dio();
    String url =
        'https://egypttourmate-001-site1.etempurl.com/api/PlaceFloorRoomStatues/GetAll';
    dio.options.headers = {
      'Authorization':
          'bearer $_token'
    };
    var response = await dio.get(url);
    var statues = PlaceFloorRoomsStatusAfter.fromJson(response.data);
    return statues;
  }
  static Future<ReadyTripDetalis?> getReadyTripDetails() async {
    Dio dio = Dio();
    String url =
        'https://egypttourmate-001-site1.etempurl.com/api/ReadyTrips/GetTripDetails';
    dio.options.headers = {
      'Authorization':
          'bearer $_token'
    };
    var response = await dio.get(url);
    var readyTrip = ReadyTripDetalis.fromJson(response.data);
    return readyTrip;
  }
}
