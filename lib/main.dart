import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wether_app/core/utils/api_services.dart';
import 'package:wether_app/features/home_feature/data/repos/home_repo_impl.dart';
import 'package:wether_app/features/home_feature/presentation/manager/weather_cubit/weather_cubit.dart';
import 'package:wether_app/features/home_feature/presentation/views/home_view.dart';

void main() {
  runApp(WetherApp());
}

class WetherApp extends StatelessWidget {
  const WetherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(HomeRepoImpl(ApiServices(Dio()))),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: HomeView()),
    );
  }
}
