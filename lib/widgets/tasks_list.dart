import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_flutter/jsp_util.dart';
import 'package:todolist_flutter/models/task_data.dart';
import 'package:todolist_flutter/views/add_task_page.dart';
import 'package:todolist_flutter/widgets/tasks_tile.dart';


class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: Provider.of<TaskData>(context).tasks.length,
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              isChecked: task.isDone,
              taskTitle: task.name,
              checkboxCallback: (bool? checkboxState) {
                taskData.updateTask(task);
              },
              longPressCallback: () {
                dataList.remove(dataList[index]);
                JSpUtil.setStringList('tasks', dataList);
                print(JSpUtil.getStringList('tasks'));

                taskData.deleteTask(task);
              },
            );
          },
        );
      },
    );
  }
}
