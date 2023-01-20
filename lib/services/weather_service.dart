import 'package:dio/dio.dart';
import 'package:weather_project/services/weather_model.dart';

String baseUrl = 'https://api.weatherapi.com/v1';
String ApiKey = '6e02271a0924481fbe892310231401';

class WeatherServices {
  late Dio dio = Dio();

  Future<WeatherModel> getWeather({required String CityName}) async {
    Response response;

    String url = '$baseUrl/forecast.json?key=$ApiKey&q=$CityName&days=7';

    response = await dio.get(url);
    // print(response.data);

    dynamic data = response.data;

    WeatherModel weather = WeatherModel.formJson(data);

    return weather;
  }
}
