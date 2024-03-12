
import 'dart:convert';
import 'package:ept_mate/model/CityResponse.dart';
import "package:http/http.dart" as http;

class ApiManger{
    static Future<CityResponse?> getData() async {
        var url=Uri.parse("https://mazenhussein-001-site1.jtempurl.com/api/CityCategory/GetAll");
        var response =await http.get(url);
            var jsonData=jsonDecode(response.body);
            CityResponse data=CityResponse.fromJson(jsonData);
        print(response.statusCode);
            return data;

  }
}