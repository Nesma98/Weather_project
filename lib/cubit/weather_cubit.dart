import 'package:bloc/bloc.dart';
import 'package:weather_project/services/weather_model.dart';
import 'package:weather_project/services/weather_service.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  WeatherCubit(this.weatherServices) : super(WeatherInitialStates());

  WeatherServices weatherServices;
  String? cityName;
  WeatherModel? weatherModel;
  void getWeather({required String CityName}) async {
    emit(WeatherLoadingStates());
    try {
      weatherModel = await weatherServices.getWeather(CityName: CityName);
      emit(WeatherSuccessStates());
    } on Exception catch (e) {
      emit(WeatherErrorStates(Error: e.toString()));
    }
  }
}
