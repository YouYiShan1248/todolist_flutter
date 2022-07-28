import 'package:flutter/material.dart';
import 'package:todolist_flutter/models/weather_model.dart';

class Weather extends ChangeNotifier{
  WeatherModel weatherModel =  WeatherModel();

   updateTemperature(dynamic weatherData) {
      return weatherData['main']['temp'];
  }
  updateMessage(dynamic weatherData) {
      var condition = weatherData['weather'][0]['id'];
      return weatherModel.getMessage(condition);
  }

}