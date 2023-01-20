import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_project/cubit/weather_cubit.dart';
import 'package:weather_project/page/search_page.dart';
import 'package:weather_project/services/weather_model.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherData;
    var controller = BlocProvider.of<WeatherCubit>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Weather',
          style: TextStyle(fontSize: 22),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SearchPage();
                  },
                ),
              );
            },
            icon: const Icon((Icons.search)),
          ),
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherStates>(
        builder: (context, state) {
          if (state is WeatherLoadingStates) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherSuccessStates) {
            return bodyWidget(controller: controller);
          } else if (state is WeatherErrorStates) {
            return const Center(
              child: Text('Somthing went wron please try again'),
            );
          } else {
            return defaultBody();
          }
        },
      ),
    );
  }
}

class bodyWidget extends StatelessWidget {
  const bodyWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final WeatherCubit controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        controller.weatherModel!.getThemeColor(),
        controller.weatherModel!.getThemeColor()[300]!,
        controller.weatherModel!.getThemeColor()[100]!,
      ])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 3,
          ),
          Text(BlocProvider.of<WeatherCubit>(context).cityName!,
              style:
                  const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          Text(
            'Update  ${controller.weatherModel!.date.hour} :  ${controller.weatherModel!.date.minute} ',
            style: const TextStyle(fontSize: 18),
          ),
          const Spacer(
            flex: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(controller.weatherModel!.getImage()),
              Text('${controller.weatherModel!.temp.toInt()}',
                  style: const TextStyle(
                      fontSize: 32, fontWeight: FontWeight.bold)),
              Column(
                children: [
                  Text('MaxTemp :${controller.weatherModel!.maxTemp.toInt()}'),
                  Text('minTemp :${controller.weatherModel!.minTemp.toInt()}'),
                ],
              ),
            ],
          ),
          const Spacer(
            flex: 1,
          ),
          Text(
            controller.weatherModel!.weatherSateName,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
          ),
          const Spacer(
            flex: 5,
          ),
        ],
      ),
    );
  }
}

class defaultBody extends StatelessWidget {
  const defaultBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'there is no weather 😔 start, searching now 🔍',
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
