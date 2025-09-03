import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/services/get_weather.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => GetWeatherCubit(GetWeatherService(Dio())),
    child: WeatherApp()));
}
class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: BlocProvider.of<GetWeatherCubit>(context).weatherModel==null ? Colors.blue :BlocProvider.of<GetWeatherCubit>(context).weatherModel!.getThemeColor()
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
