import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wether_app/core/utils/assets_data.dart';
import 'package:wether_app/features/home_feature/presentation/manager/weather_cubit/weather_cubit.dart';
import 'package:wether_app/features/home_feature/presentation/manager/weather_cubit/weather_state.dart';
import 'package:wether_app/features/home_feature/presentation/views/widgets/custom_text_filed.dart';
import 'package:wether_app/features/home_feature/presentation/views/widgets/home_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocConsumer<WeatherCubit, WeatherState>(
          listener: (context, state) {
            stateCondetion(state);
          },
          builder: (context, state) {
            if (state is WeatherSucess) {
              return Image.asset(
                AssetsData.backGroundImage,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              );
            } else {
              return Image.asset(
                'assets/images/clear.jpg',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              );
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                CustomTextFiled(),
                SizedBox(height: 15),
                HomeSection(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void stateCondetion(WeatherState state) {
    if (state is WeatherSucess) {
      if (state.weatherModel.state.contains('rain')) {
        AssetsData.backGroundImage = 'assets/images/rain.jpg';
        AssetsData.iconHaza = 'assets/icons/Rain.png';
        print('rain');
      } else if (state.weatherModel.state.contains('Sunny') ||
          state.weatherModel.state.contains('Clear')) {
        AssetsData.backGroundImage = 'assets/images/clear.jpg';
        AssetsData.iconHaza = 'assets/icons/Clear.png';
        print('Sunny');
      } else if (state.weatherModel.state.contains('Cloudy')) {
        AssetsData.backGroundImage = 'assets/images/clouds.jpg';
        AssetsData.iconHaza = 'assets/icons/Clouds.png';
        print('Cloudy');
      } else if (state.weatherModel.state.contains('thunderstorm')) {
        AssetsData.backGroundImage = 'assets/images/thunderstorm.png';
        AssetsData.iconHaza = 'assets/icons/Thunderstorm.png';
        print('thunderstorm');
      } else if (state.weatherModel.state.contains('Overcast')) {
        AssetsData.backGroundImage = 'assets/images/haze.png';
        AssetsData.iconHaza = 'assets/icons/Haze.png';
        print('Haze');
      } else {
        AssetsData.backGroundImage = 'assets/images/fog.jpg';
        AssetsData.iconHaza = 'assets/icons/Clouds.png';
      }
    }
  }
}
