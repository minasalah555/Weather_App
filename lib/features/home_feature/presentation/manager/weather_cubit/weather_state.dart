import 'package:wether_app/features/home_feature/data/models/weather_model.dart';

sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherFailure extends WeatherState {
  final String errMessage;

  WeatherFailure({required this.errMessage});
}

final class WeatherSucess extends WeatherState {
  final WeatherModel weatherModel;

  WeatherSucess({required this.weatherModel});
}
