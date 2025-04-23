import 'package:dartz/dartz.dart';
import 'package:wether_app/core/errors/failures.dart';
import 'package:wether_app/features/home_feature/data/models/weather_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, WeatherModel>> fetchWeatherData({
    required String cityName,
  });
}
