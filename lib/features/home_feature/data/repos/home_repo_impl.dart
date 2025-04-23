import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wether_app/core/errors/failures.dart';
import 'package:wether_app/core/utils/api_services.dart';
import 'package:wether_app/features/home_feature/data/models/weather_model.dart';
import 'package:wether_app/features/home_feature/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  ApiServices apiServices;
  HomeRepoImpl(this.apiServices);
  @override
  Future<Either<Failure, WeatherModel>> fetchWeatherData({
    required String cityName,
  }) async {
    try {
      Map<String, dynamic> jsonData = await apiServices.getWeatherData(
        cityName: cityName,
      );
      WeatherModel weatherModel = WeatherModel.fromJson(jsonData);
      return right(weatherModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure('Oops there is an error ${e.toString()}'));
    }
  }
}
