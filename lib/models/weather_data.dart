import 'package:todolist_flutter/controller/loation.dart';
import 'package:dio/dio.dart';

class WeatherModel{
  String myApiKey = 'bc447f7ec08b60c799bea73aaf5d9990';
  late double getLatitude;
  late double getLongitude;

  getLocationWeather()async{
    Location location = Location();
    await location.getCurrentLocation();

    getLatitude = location.latitude!;
    getLongitude = location.longitude!;


    var response =await Dio().get('https://api.openweathermap.org/data/2.5/weather?lat=$getLatitude&lon=$getLongitude&appid=$myApiKey&units=metric');
    return response;

  }


}