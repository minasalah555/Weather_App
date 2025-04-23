import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wether_app/features/home_feature/presentation/manager/weather_cubit/weather_cubit.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (cityName) {
        context.read<WeatherCubit>().getWeatherData(cityName: cityName);
      },
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.search),
        filled: true,
        fillColor: Colors.black26,
        hintText: 'enter city name',
        enabledBorder: textBorder(),
        focusedBorder: textBorder(),
      ),
    );
  }

  OutlineInputBorder textBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: const Color.fromARGB(255, 65, 40, 136)),
      borderRadius: BorderRadius.circular(16),
    );
  }
}
