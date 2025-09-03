import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Weather App ", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SearchScreen();
                  },
                ),
              );
            },
            icon: Icon(Icons.search, color: Colors.black),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, GetWeatherState>(
        builder: (context, state) {
          if (state is GetWeatherLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is GetWeatherSuccess) {
            final WeatherModel weatherData = state.weatherModel;
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    weatherData.getThemeColor(),
                    weatherData.getThemeColor()[300]!,
                    weatherData.getThemeColor()[100]!,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 3),
                  Text(
                    state.cityName  ,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'updated at : ${weatherData.date?.hour.toString()}:${weatherData.date?.minute.toString()}',
                    style: TextStyle(fontSize: 22),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(weatherData.getImage()),
                        Text(
                          weatherData.temp.toString(),
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Column(
                          children: [
                            Text('maxTemp :${weatherData.maxTemp.toString()}'),
                            Text('minTemp :${weatherData.minTemp.toString()}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    weatherData.weatherStateName,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Spacer(flex: 5),
                ],
              ),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "There is no weather 😔",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  Text(
                    "Start searching now 🔎",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
