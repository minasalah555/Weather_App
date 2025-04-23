import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wether_app/features/home_feature/data/repos/home_repo_impl.dart';
import 'package:wether_app/features/home_feature/presentation/manager/weather_cubit/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.homeRepoImpl) : super(WeatherInitial());
  HomeRepoImpl homeRepoImpl;
  Future<void> getWeatherData({required String cityName}) async {
    emit(WeatherLoading());
    var data = await homeRepoImpl.fetchWeatherData(cityName: cityName);
    data.fold(
      (failure) {
        emit(WeatherFailure(errMessage: failure.errMessage));
      },
      (weatherData) {
        emit(WeatherSucess(weatherModel: weatherData));
      },
    );
  }
}
