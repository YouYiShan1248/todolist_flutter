import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_flutter/models/task_data.dart';
import 'package:todolist_flutter/views/tasks_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context)=>TaskData(),
      child: MaterialApp(
        home: TasksPage(),
      ),
    );
  }
}
