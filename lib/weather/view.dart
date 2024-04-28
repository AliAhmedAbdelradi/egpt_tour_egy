import 'package:dio/dio.dart';
import 'package:ept_mate/weather/weatherModel.dart';
import 'package:flutter/material.dart';

class weatherView extends StatefulWidget {
  static const String routeName = "weather";

  const weatherView({super.key});

  @override
  State<weatherView> createState() => _weatherViewState();
}

class _weatherViewState extends State<weatherView> {
  final cityController = TextEditingController(text: "");
  bool isLoading = false;
  WeatherModel? model;

  getData() async {
    isLoading = true;
    setState(() {});
    final response = await Dio().get(
        "https://api.openweathermap.org/data/2.5/weather?q=${cityController.text}&appid=509dc5d730ff2dd6003b22f30ae93313");
    print(response.data);
     model = WeatherModel.fromJson(response.data);
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            TextFormField(
              controller: cityController,
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () {
                  getData();
                },
                child: Text("Get")),
            isLoading
                ? CircularProgressIndicator()
                : model != null
                    ? Container(
                     margin: EdgeInsets.only(top: 100),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            Image(image: AssetImage("assets/images/weather.png"),height: 100,width: 100,),
                            Text(
                              "Temp :${model!.main.temp}",
                              style: TextStyle(color: Colors.black),
                            ),

                            Text("Speed 0f wind :${model!.wind.speed}",
                                style: TextStyle(color: Colors.black)),
                            Text(model!.name,
                                style: TextStyle(color: Colors.black,fontSize: 25)),
                          ],
                        ),
                    )
                    : SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
