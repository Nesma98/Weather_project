part of 'weather_cubit.dart';

abstract class WeatherStates {}
class WeatherInitialStates extends WeatherStates {}
class WeatherLoadingStates extends WeatherStates {}
class WeatherSuccessStates extends WeatherStates {}
class WeatherErrorStates extends WeatherStates {
  String Error;
  WeatherErrorStates({required this.Error});
}
