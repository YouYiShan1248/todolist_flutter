import 'package:flutter/material.dart';
import 'package:todolist_flutter/models/weather_model.dart';
import 'package:todolist_flutter/views/add_task_page.dart';
import '../widgets/tasks_list.dart';

class TasksPage extends StatelessWidget {
  final locationWeather;
  TasksPage({Key? key, this.locationWeather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel = WeatherModel();

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTaskPage(),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${locationWeather['main']['temp']}℃',
                  // '${Provider.of<Weather>(context).updateTemperature(locationWeather)}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  weatherModel.getMessage(locationWeather['weather'][0]['id']),
                  // Provider.of<Weather>(context).updateMessage(locationWeather),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w300),
                ),
                Text(
                  'data',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: TasksList(),
            ),
          ),
        ],
      ),
    );
  }
}
