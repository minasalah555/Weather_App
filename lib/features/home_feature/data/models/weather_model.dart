import 'dart:convert';

class WeatherModel {
  final String cityName;
  final String sunrise;
  final String state;
  final String sunset;
  final num humidity;
  final num maxtemp_c;
  final num mintemp_c;
  final num avgtemp_c;
  final num windSpeed;
  final num precip_mm;

  WeatherModel({
    required this.precip_mm,
    required this.windSpeed,
    required this.humidity,
    required this.cityName,
    required this.maxtemp_c,
    required this.mintemp_c,
    required this.avgtemp_c,
    required this.sunrise,
    required this.sunset,
    required this.state,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> jsonData) {
    return WeatherModel(
      cityName: jsonData["location"]['name'],
      state: jsonData['current']['condition']['text'],
      humidity: jsonData['current']['humidity'],
      windSpeed: jsonData['current']['wind_kph'],
      precip_mm: jsonData['current']['precip_mm'],
      sunset: jsonData["forecast"]["forecastday"][0]["astro"]['sunset'],
      sunrise: jsonData["forecast"]["forecastday"][0]["astro"]['sunrise'],
      avgtemp_c: jsonData["forecast"]["forecastday"][0]["day"]['avgtemp_c'],
      maxtemp_c: jsonData["forecast"]["forecastday"][0]["day"]['maxtemp_c'],
      mintemp_c: jsonData["forecast"]["forecastday"][0]["day"]['mintemp_c'],
    );
  }
}
