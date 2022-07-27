import 'package:flutter/material.dart';
import 'package:todolist_flutter/views/tasks_page.dart';
import 'package:todolist_flutter/models/weather_data.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  getLocation() async {
    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return TasksPage(locationWeather: weatherData,);
        },
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
