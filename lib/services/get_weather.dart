
import 'package:dio/dio.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/models/weather_model.dart';

class GetWeatherService {
    final Dio dio;

  GetWeatherService(this.dio);
  Future<dynamic> getWeather({required String cityName}) async {
    Response response = await dio.get("http://api.weatherapi.com/v1/forecast.json?key=$kApiKey&q=$cityName&days=7");
    if (response.statusCode != 200) {
    var data  = response.data;
      throw Exception(data['error']['message']);
    }
    Map<String, dynamic> data = response.data;

    WeatherModel weather = WeatherModel.fromJson(data);

    return weather;
  }
}