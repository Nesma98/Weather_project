import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_project/cubit/weather_cubit.dart';
import 'package:weather_project/page/HomePage.dart';
import 'package:weather_project/services/weather_service.dart';

void main() async {
//await weatherServices.init();
  runApp(BlocProvider(
    create: (context) => WeatherCubit(WeatherServices()),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var controller = BlocProvider.of<WeatherCubit>(context);
    return BlocBuilder<WeatherCubit, WeatherStates>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            primarySwatch:
                BlocProvider.of<WeatherCubit>(context).weatherModel == null
                    ? Colors.blue
                    : BlocProvider.of<WeatherCubit>(context)
                        .weatherModel!
                        .getThemeColor(),
          ),
          home: HomePage(),
        );
      },
    );
  }
}
