import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_project/cubit/weather_cubit.dart';

class SearchPage extends StatelessWidget {
  String? cityName;

  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocBuilder<WeatherCubit, WeatherStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Search a City'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: TextField(
                onChanged: (data) {
                  cityName = data;
                },
                onSubmitted: (data) async {
                  cityName = data;
                  BlocProvider.of<WeatherCubit>(context)
                      .getWeather(CityName: cityName!);

                  BlocProvider.of<WeatherCubit>(context).cityName = cityName!;
                  Navigator.pop(context);
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: height / 28, horizontal: height / 54),
                  suffixIcon: const Icon(Icons.search),
                  hintText: 'Enter City',
                  label: const Text('search'),
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
