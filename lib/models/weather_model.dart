import 'package:todolist_flutter/controller/loation.dart';
import 'package:todolist_flutter/controller/network.dart';

class WeatherModel {
  String baseUri = 'https://api.openweathermap.org/data/2.5/weather';
  String myApiKey = 'bc447f7ec08b60c799bea73aaf5d9990';
  late double getLatitude;
  late double getLongitude;

  getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    getLatitude = location.latitude!;
    getLongitude = location.longitude!;

    NetworkHelper networkHelper = NetworkHelper(url: '$baseUri?lat=$getLatitude&lon=$getLongitude&appid=$myApiKey&units=metric');
    var weatherData = networkHelper.getData();
    return weatherData;
  }

}
