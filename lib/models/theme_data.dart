import 'package:flutter/material.dart';
import 'package:todolist_flutter/models/themes.dart';

class MyThemesData extends ChangeNotifier {
  ThemeData currentTheme = Themes().lightTheme;
  Color currentColor = Themes().lightColor;

  void toggleTheme() {
    if(currentTheme==Themes().lightTheme){
      currentTheme =  Themes().darkTheme;
      currentColor = Themes().darkColor;
    }else{
      currentTheme =  Themes().lightTheme;
      currentColor = Themes().lightColor;
    }

    // currentTheme==Themes().lightTheme ? currentTheme =  Themes().darkTheme : currentTheme = Themes().lightTheme;
    notifyListeners();
  }
}
