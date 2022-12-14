import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todolist_flutter/jsp_util.dart';
import 'package:todolist_flutter/models/task_data.dart';
import 'package:todolist_flutter/models/theme_data.dart';
import 'package:todolist_flutter/views/add_task_page.dart';
import '../generated/l10n.dart';
import '../widgets/tasks_list.dart';

class TasksPage extends StatelessWidget {
  final locationWeather;
  TasksPage({Key? key, this.locationWeather}) : super(key: key);
  static String id = '/TasksPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //使用底部弹窗showModalBottomSheet而不使用showBottomSheet，showBottomSheet会报错
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
                top: 60.0.sp, left: 30.0.sp, right: 30.0.sp, bottom: 30.0.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${locationWeather['main']['temp']}℃',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50.0.sp,
                          fontWeight: FontWeight.w700),
                    ),
                    IconButton(
                      onPressed: () {
                        Provider.of<MyThemesData>(context, listen: false)
                            .toggleTheme();
                      },
                      icon: Icon(
                        Icons.contrast_sharp,
                        size: 30.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Text(
                  S.of(context).TabTitle,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0.sp,
                      fontWeight: FontWeight.w300),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${Provider.of<TaskData>(context).taskCount} ${S.of(context).tasks}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0.sp,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        dataList = JSpUtil.getStringList('tasks');
                        for (String data in JSpUtil.getStringList('tasks')) {
                          Provider.of<TaskData>(context, listen: false)
                              .addTask(data);
                        }
                      },
                      icon: Icon(
                        Icons.update,
                        color: Colors.white,
                        size: 30.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0.sp),
                  topRight: Radius.circular(30.0.sp),
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
