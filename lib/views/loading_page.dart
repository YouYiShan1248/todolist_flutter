import 'package:flutter/material.dart';
import 'package:todolist_flutter/jsp_util.dart';
import 'package:todolist_flutter/views/tasks_page.dart';
import 'package:todolist_flutter/models/weather_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  static String id = '/LoadingPage';


  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  getLocation() async {
    var weatherData = await WeatherModel().getLocationWeather();

    // Navigator.pushNamedAndRemoveUntil(context,TasksPage.id, (route) => false);

    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return TasksPage(
        locationWeather: weatherData,
      );
    }), (route) => false);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Center(
          child: Image.asset(
            'images/plan.png',
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).padding.top + 20,
          right: MediaQuery.of(context).padding.right + 20,
          child: SpinKitFadingCircle(
            color: Colors.black54,
            size: 50.0,
          ),
        ),
      ],
    ),);
  }
}
