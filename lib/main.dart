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
