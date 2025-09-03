import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/get_weather.dart';

part 'get_weather_state.dart';

class GetWeatherCubit extends Cubit<GetWeatherState> {
  GetWeatherCubit(this.getWeatherService) : super(GetWeatherInitial());
  final GetWeatherService getWeatherService;

  
  void getWeather({required String cityName}) async {
    emit(GetWeatherLoading());
    try {
    var weather =  await getWeatherService.getWeather(cityName: cityName);
      emit(GetWeatherSuccess(weather,cityName));
    } catch (e) {
      emit(GetWeatherFailure(e.toString()));
    }
  }
}
