import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todolist_flutter/jsp_util.dart';
import 'package:todolist_flutter/models/task_data.dart';
import 'package:todolist_flutter/views/loading_page.dart';
import 'generated/l10n.dart';
import 'routes.dart';
import 'models/theme_data.dart';
import 'models/themes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //初始化
  await JSpUtil.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => TaskData()),
        ChangeNotifierProvider(create: (BuildContext context) => MyThemesData()),
      ],
      child: Consumer(
        builder: (context, appModel, child) {
          return ScreenUtilInit(
            designSize: const Size(392.72, 801.45),
            builder: (BuildContext context, Widget? child) => MaterialApp(
              theme: Provider.of<MyThemesData>(context).currentTheme,
              darkTheme: Themes().darkTheme,
              home: LoadingPage(),


              //在Plugins下载intl插件，使用intl插件可以更方便管理国际化配置
              //导入国际化支持包
              //  intl: ^0.17.0
              //   flutter_localizations:
              //     sdk: flutter
              //运行flutter intl:intialize进行初始化，这会为我们添加国际化文件的基本目录
              //运行flutter intl:Add locale 添加语言种类名称如zh_CH
              //在对应的arb文件添加对应字段的中英文内容
              //在我们MaterialApp中添加国际化配置，如下
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                S.delegate
              ],
              supportedLocales: [
                const Locale('en', ''),
                ...S.delegate.supportedLocales
              ],

              //在对应文本中通过S.of(context)来调用国际化文本


              initialRoute: LoadingPage.id,
              // routes: <String, WidgetBuilder>{
              //   LoadingPage.id: (context) => LoadingPage(),
              //   TasksPage.id: (context,{arguments}) => TasksPage(locationWeather: arguments),
              //   AddTaskPage.id: (context) => AddTaskPage(),
              // },

              onGenerateRoute: onGenerateRoute,
            ),
          );
        },
      ),
    );
  }
}
