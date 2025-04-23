import 'package:dio/dio.dart';

class ApiServices {
  final String apiKey = '55311251442b409ea0e113729252103';
  final String baseUrl = 'https://api.weatherapi.com/v1';
  Dio dio;
  ApiServices(this.dio);
  Future<Map<String, dynamic>> getWeatherData({
    required String cityName,
  }) async {
    Response response = await dio.get(
      '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7',
    );
    print(response.statusCode);
    print(response.data);
    return response.data;
  }
}
//$