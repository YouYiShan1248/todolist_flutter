import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_flutter/models/task_data.dart';
import 'package:todolist_flutter/models/theme_data.dart';
import '../generated/l10n.dart';

String? taskTitle;

class AddTaskPage extends StatelessWidget {
  static String id = '/AddTasksPage';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF757575),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 60.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              S.of(context).AddTask,
              textAlign: TextAlign.center,
              style: TextStyle(color: Provider.of<MyThemesData>(context).currentColor, fontSize: 30.0),
            ),
            TextField(
              onChanged: (value) {
                taskTitle = value;
              },
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Provider.of<MyThemesData>(context).currentColor,
                    width: 5,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            MaterialButton(
              padding: EdgeInsets.all(30.0),
              color: Provider.of<MyThemesData>(context).currentColor,
              onPressed: () {
                Provider.of<TaskData>(context, listen: false)
                    .addTask(taskTitle!);
                Navigator.pop(context);
              },
              child: Text(
                S.of(context).Add,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
