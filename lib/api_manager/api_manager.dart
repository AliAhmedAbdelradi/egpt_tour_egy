import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ept_mate/model/CategoryModel.dart';
import 'package:ept_mate/model/trip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/AddOrRemoveFavourites.dart';
import '../model/AllPlaces.dart';
import '../model/CityAfterEdit.dart';
import '../model/FastTripPlan.dart';
import '../model/FavouriteModel.dart';
import '../model/GetFastTripsById.dart';
import '../model/GetReadyMateById.dart';
import '../model/InteractiveMapByPlaceId.dart';
import '../model/PlaceDetailsByPlaceId.dart';
import '../model/PlaceFloorRoomStatuesByIdRoom.dart';
import '../model/PlaceFloorRoomsById.dart';
import '../model/PlaceFloorRoomsStatusAfter.dart';
import '../model/PlaceModel.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../model/ReadyMateModel4.dart';
import '../model/delete.dart'; // Import PrettyDioLogger

class ApiManager {
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(
        'token'); // Assuming 'token' is the key for your token in SharedPreferences
  }

  static Future<CityAfterEdit?> getData() async {
    Dio dio = Dio();
    String url =
        'https://egyptttourmate-001-site1.gtempurl.com/api/CityCategory/GetAll';
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
        'https://egyptttourmate-001-site1.gtempurl.com/api/TourismCategories/GetAll';
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
        'https://egyptttourmate-001-site1.gtempurl.com/api/CityCategory/GetAll';
    String? token = await getToken(); // Get token asynchronously
    if (token != null) {
      dio.options.headers = {'Authorization': 'bearer $token'};
    }

    var response = await dio.get(url);
    var city = CityAfterEdit.fromJson(response.data);
    return city;
  }

  static Future<ReadyMateModel4?> getReady() async {
    Dio dio = Dio();
    String url =
        'https://egyptttourmate-001-site1.gtempurl.com/api/ReadyTrips/GetTrips';
    String? token = await getToken(); // Get token asynchronously
    if (token != null) {
      dio.options.headers = {'Authorization': 'bearer $token'};
    }

    var response = await dio.get(url);
    var ready = ReadyMateModel4.fromJson(response.data);
    return ready;
  }

  static String url = 'https://egyptttourmate-001-site1.gtempurl.com/';

  static Future<PlaceModel?> getPlaceById({
    required String categoryId,
    required String cityId,
  }) async {
    Dio dio = Dio();
    String url = 'https://egyptttourmate-001-site1.gtempurl.com';
    String? token = await getToken(); // Get token asynchronously
    if (token != null) {
      dio.options.headers = {'Authorization': 'bearer $token'};
    }

    var response = await dio.get(
        "$url/api/Places/GetByCategoryAndCity?categoryId=$categoryId&cityId=$cityId");
    var place = PlaceModel.fromJson(response.data);
    return place;
  }

  static Future<PlaceFloorRoomsById?> getFloorDetails({
    required int floorId,
  }) async {
    Dio dio = Dio();
    String url =
        'https://egyptttourmate-001-site1.gtempurl.com/api/PlaceFloorRooms/GetById?Id=$floorId';
    String? token = await getToken(); // Get token asynchronously
    if (token != null) {
      dio.options.headers = {'Authorization': 'bearer $token'};
    }
    var response = await dio.get(url);
    var floor = PlaceFloorRoomsById.fromJson(response.data);
    return floor;
  }

  static Future<PlaceFloorRoomStatuesByIdRoom?> getPlaceFloorRoomStatues(
      {required int roomId}) async {
    Dio dio = Dio();
    String url =
        'https://egyptttourmate-001-site1.gtempurl.com/api/PlaceFloorRoomStatues/GetByRoomId?roomId=$roomId';
    String? token = await getToken(); // Get token asynchronously
    if (token != null) {
      dio.options.headers = {'Authorization': 'bearer $token'};
    }
    var response = await dio.get(url);
    var statues = PlaceFloorRoomStatuesByIdRoom.fromJson(response.data);
    return statues;
  }

  static Future<PlaceFloorRoomsStatusAfter?> getFloorRoomStatues() async {
    Dio dio = Dio();
    String url =
        'https://egyptttourmate-001-site1.gtempurl.com/api/PlaceFloorRoomStatues/GetAll';
    String? token = await getToken(); // Get token asynchronously
    if (token != null) {
      dio.options.headers = {'Authorization': 'bearer $token'};
    }
    var response = await dio.get(url);
    var statues = PlaceFloorRoomsStatusAfter.fromJson(response.data);
    return statues;
  }

  static Future<void> addTrip(Trip trip) async {
    trip.nameOfTrip = "TEST";
    print(trip.toJson());
    Dio dio = Dio();
    String url =
        'https://egyptttourmate-001-site1.gtempurl.com/api/UserTrips/Add';
    String? token = await getToken(); // Get token asynchronously
    if (token != null) {
      dio.options.headers = {'Authorization': 'bearer $token'};
    }
    try {
      var response = await dio.post(url, data: FormData.fromMap(trip.toJson()));
      print(response.data);
    } catch (e) {
      print(e);
    }
  }

  static Future<PlaceModel?> getplaceByCityId({
    required String cityId,
  }) async {
    Dio dio = Dio();
    String url = 'https://egyptttourmate-001-site1.gtempurl.com';
    String? token = await getToken(); // Get token asynchronously
    if (token != null) {
      dio.options.headers = {'Authorization': 'bearer $token'};
    }
    var response = await dio.get("$url/api/Places/GetByCity?cityId=$cityId");
    var place = PlaceModel.fromJson(response.data);
    return place;
  }

  static Future<PlaceDetailsByPlaceId?> getPlaceDetailsPlaceId({
    required String placeId,
  }) async {
    Dio dio = Dio();
    String url = 'https://egyptttourmate-001-site1.gtempurl.com';
    String? token = await getToken(); // Get token asynchronously
    if (token != null) {
      dio.options.headers = {'Authorization': 'bearer $token'};
    }
    var response =
    await dio.get("$url/api/PlaceDetails/GetByPlaceId?placeId=$placeId");
    var placeDetails = PlaceDetailsByPlaceId.fromJson(response.data);
    return placeDetails;
  }

  static Future<GetReadyMateById?> getReadyMateById({
    required int id,
  }) async {
    Dio dio = Dio();
    String url = 'https://egyptttourmate-001-site1.gtempurl.com';
    String? token = await getToken(); // Get token asynchronously
    if (token != null) {
      dio.options.headers = {'Authorization': 'bearer $token'};
    }
    var response = await dio.get("$url/api/ReadyTrips/GetTripsById?Id= $id");
    var readyMateById = GetReadyMateById.fromJson(response.data);
    return readyMateById;
  }

  static Future<FastTripPlan?> getFastTrip() async {
    Dio dio = Dio();
    String url =
        'https://egyptttourmate-001-site1.gtempurl.com/api/ReadyTrips/GetFastTrips';
    String? token = await getToken(); // Get token asynchronously
    if (token != null) {
      dio.options.headers = {'Authorization': 'bearer $token'};
    }

    var response = await dio.get(url);
    var category = FastTripPlan.fromJson(response.data);
    return category;
  }

  static Future<InteractiveMapByPlaceId?> getInteractiveMapByPlaceId({
    required int placeId,
  }) async {
    Dio dio = Dio();
    String url = 'https://egyptttourmate-001-site1.gtempurl.com';
    String? token = await getToken(); // Get token asynchronously
    if (token != null) {
      dio.options.headers = {'Authorization': 'bearer $token'};
    }
    var response = await dio.get(
        "$url/api/PlaceDetails/GetInteractiveMapByPlaceId?placeId=$placeId");
    var interactiveMap = InteractiveMapByPlaceId.fromJson(response.data);
    return interactiveMap;
  }

  static List<FavouriteModel>favouritse = [];
  static Set<String>favouriteId = {};

  static Future<FavouriteModel?> getFavourite() async {
    favouritse.clear();
    favouriteId.clear();
    Dio dio = Dio();
    String url = 'https://egyptttourmate-001-site1.gtempurl.com';
    String? token = await getToken(); // Get token asynchronously
    if (token != null) {
      dio.options.headers = {'Authorization': 'bearer $token'};
    }
    var response = await dio.get("$url/api/UserFavorits/GetAll");
    var fav = FavouriteModel.fromJson(response.data);
    return fav;
  }

  static Future<void> addAndRemoveFromFavourite(
      {required String placeId}) async {
    Dio dio = Dio();
    String url = 'https://egyptttourmate-001-site1.gtempurl.com';
    String? token = await getToken(); // Get token asynchronously

    if (token != null) {
      dio.options.headers = {'Authorization': 'bearer $token'};
    }

      var response = await dio.post(
          "$url/api/UserFavorits/Add",
          data: {
            "id": 0,
            "userId": "string",
            "placeId": placeId
          }
      );

      if (response.data is Map<String, dynamic>) {
        var responsy = response.data as Map<String, dynamic>;
        if (responsy['success'] == true) {
          if (favouriteId.contains(placeId)) {

            favouriteId.remove(placeId);
            favouritse.remove(placeId);
          } else {
            favouriteId.add(placeId);
            favouritse.add(placeId as FavouriteModel);
          }
        }
      }
  }
  static Future<Delete> DelFavourite(
      {required String favId}) async {
    Dio dio = Dio();
    String url = 'https://egyptttourmate-001-site1.gtempurl.com';
    String? token = await getToken(); // Get token asynchronously

    if (token != null) {
      dio.options.headers = {'Authorization': 'bearer $token'};
    }

    var response = await dio.post(
        "$url/api/UserFavorits/Delete?ID=$favId");
        var delete = Delete.fromJson(response.data);
        return delete;

    ;

  }



  static Future<AllPlaces?> getAllPlacess({String? query}) async {
    Dio dio = Dio();
    String url =
        'https://egyptttourmate-001-site1.gtempurl.com/api/Places/GetAll';
    String? token = await getToken(); // Get token asynchronously
    if (token != null) {
      dio.options.headers = {'Authorization': 'bearer $token'};
    }
    List<String> result = [];

    var response = await dio.get(url);
    var placess = AllPlaces.fromJson(response.data);


   if (query != null && query.isNotEmpty) {
      result = result.where((element) {
        final name = element;
        return name.toString().toLowerCase().contains(query.toLowerCase());
      }).toList();
    }


    return placess;
  }

  static Future<GetFastTripsById?> getFastTripsById({
    required int fastTripsId,
  }) async {
    Dio dio = Dio();
    String url = 'https://egyptttourmate-001-site1.gtempurl.com';
    String? token = await getToken(); // Get token asynchronously
    if (token != null) {
      dio.options.headers = {'Authorization': 'bearer $token'};
    }
    var response = await dio.get(
        "$url/api/ReadyTrips/GetFastTripsById?Id=$fastTripsId");
    var fstrip = GetFastTripsById.fromJson(response.data);
    return fstrip;
  }
}
