import 'package:flutter/material.dart';
import 'package:todolist_flutter/views/add_task_page.dart';
import 'package:todolist_flutter/views/loading_page.dart';
import 'package:todolist_flutter/views/tasks_page.dart';
//配置路由
final routes = {
  LoadingPage.id: (context) => LoadingPage(),
  TasksPage.id: (context,{arguments}) => TasksPage(locationWeather: arguments),
  AddTaskPage.id: (context) => AddTaskPage(),
};


var onGenerateRoute = (RouteSettings settings) {
  //统一处理
  final String? name = settings.name;
  final Function pageContentBuilder = routes[name] as Function;
  if (settings.arguments != null) {
    final Route route = MaterialPageRoute(
        builder: (context) =>
            pageContentBuilder(context, arguments: settings.arguments));
    return route;
  } else {
    final Route route =
    MaterialPageRoute(builder: (context) => pageContentBuilder(context));
    return route;
  }
};
