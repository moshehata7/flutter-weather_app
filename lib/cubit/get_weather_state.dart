part of 'get_weather_cubit.dart';

@immutable
sealed class GetWeatherState {}

final class GetWeatherInitial extends GetWeatherState {}

final class GetWeatherSuccess extends GetWeatherState {}

final class GetWeatherLoading extends GetWeatherState {}

final class GetWeatherFailure extends GetWeatherState {
  final String errorMessage;

  GetWeatherFailure(this.errorMessage);
}
