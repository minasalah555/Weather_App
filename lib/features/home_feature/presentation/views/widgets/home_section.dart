import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wether_app/core/utils/assets_data.dart';
import 'package:wether_app/core/utils/styles.dart';
import 'package:wether_app/core/widgets/custom_error_widget.dart';
import 'package:wether_app/core/widgets/custom_loading_widget.dart';
import 'package:wether_app/features/home_feature/presentation/manager/weather_cubit/weather_cubit.dart';
import 'package:wether_app/features/home_feature/presentation/manager/weather_cubit/weather_state.dart';
import 'package:wether_app/features/home_feature/presentation/views/widgets/custom_tile_data.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherSucess) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on),
                  Text(state.weatherModel.cityName, style: Styles.textStyle20),
                ],
              ),
              SizedBox(height: 40),
              Text(
                '${state.weatherModel.avgtemp_c} c',
                style: Styles.textStyle90,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      state.weatherModel.state,
                      style: Styles.textStyle24.copyWith(color: Colors.black),
                    ),
                  ),
                  Image.asset(
                    AssetsData.iconHaza,
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.arrow_upward),
                  Text(
                    '${state.weatherModel.maxtemp_c} c',
                    style: Styles.textStyle22,
                  ),
                  Icon(Icons.arrow_downward),
                  Text(
                    '${state.weatherModel.mintemp_c} c',
                    style: Styles.textStyle22,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Card(
                elevation: 5,
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                  child: Column(
                    children: [
                      CustomTileData(
                        index1: 'SunRise',
                        index2: 'SunSit',
                        value1: state.weatherModel.sunrise,
                        value2: state.weatherModel.sunset,
                      ),
                      SizedBox(height: 10),

                      CustomTileData(
                        index1: 'Humidity',
                        index2: 'Visibility',
                        value1: '${state.weatherModel.humidity}',
                        value2: '10000',
                      ),
                      SizedBox(height: 10),
                      CustomTileData(
                        index1: 'Precipitation',
                        index2: 'wind speed',
                        value1: '${state.weatherModel.precip_mm}',
                        value2: '${state.weatherModel.windSpeed}',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else if (state is WeatherFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else if (state is WeatherLoading) {
          return Padding(
            padding: const EdgeInsets.only(top: 300),
            child: CustomLoadingWidget(),
          );
        } else {
          return Center(
            child: Text(
              'Write City Name Please !! ...',
              style: Styles.textStyle40,
            ),
          );
        }
      },
    );
  }
}
