import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class GetWeather {
    final Dio dio;

  GetWeather(this.dio);
  Future<dynamic> getWeather() async {
    Response response = await dio.get("http://api.weatherapi.com/v1/forecast.json?key=cea6d825185b431abb591931251807&q=London&days=7");
    if (response.statusCode != 200) {
    var data  = response.data;
      throw Exception(data['error']['message']);
    }
    Map<String, dynamic> data = response.data;

    WeatherModel weather = WeatherModel.fromJson(data);

    return weather;
  }
}