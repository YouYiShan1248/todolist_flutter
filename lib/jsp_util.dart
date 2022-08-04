import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class JSpUtil {
  JSpUtil._internal();

  factory JSpUtil() => _instance;

  static late final JSpUtil _instance = JSpUtil._internal();

  //初始化
  static late SharedPreferences _preferences;

  static Future<JSpUtil> getInstance() async {
    _preferences = await SharedPreferences.getInstance();
    return _instance;
  }

  //get set方法封装

  /// 根据key存储int类型
  static Future<bool> setInt(String key, int value) {
    return _preferences.setInt(key, value);
  }

  /// 根据key获取int类型
  static int? getInt(String key, {int defaultValue = 0}) {
    return _preferences.getInt(key) ?? defaultValue;
  }

  /// 根据key存储double类型
  static Future<bool> setDouble(String key, double value) {
    return _preferences.setDouble(key, value);
  }

  /// 根据key获取double类型
  static double? getDouble(String key, {double defaultValue = 0.0}) {
    return _preferences.getDouble(key) ?? defaultValue;
  }

  /// 根据key存储字符串类型
  static Future<bool> setString(String key, String value) {
    return _preferences.setString(key, value);
  }

  /// 根据key获取字符串类型
  static String? getString(String key, {String defaultValue = ""}) {
    return _preferences.getString(key) ?? defaultValue;
  }

  /// 根据key存储布尔类型
  static Future<bool> setBool(String key, bool value) {
    return _preferences.setBool(key, value);
  }

  /// 根据key获取布尔类型
  static bool? getBool(String key, {bool defaultValue = false}) {
    return _preferences.getBool(key) ?? defaultValue;
  }

  /// 根据key存储字符串类型数组
  static Future<bool> setStringList(String key, List<String> value) {
    return _preferences.setStringList(key, value);
  }

  /// 根据key获取字符串类型数组
  static List<String> getStringList(String key,
      {List<String> defaultValue = const []}) {
    return _preferences.getStringList(key) ?? defaultValue;
  }

  /// 根据key存储Map类型
  static Future<bool> setMap(String key, Map value) {
    return _preferences.setString(key, json.encode(value));
  }

  /// 根据key获取Map类型
  static Map getMap(String key) {
    String jsonStr = _preferences.getString(key) ?? "";
    return jsonStr.isEmpty ? Map : json.decode(jsonStr);
  }

  //其他方法封装

  /// 获取持久化数据中所有存入的key
  static Set<String> getKeys() {
    return _preferences.getKeys();
  }

  /// 获取持久化数据中是否包含某个key
  static bool containsKey(String key) {
    return _preferences.containsKey(key);
  }

  /// 删除持久化数据中某个key
  static Future<bool> remove(String key) async {
    return await _preferences.remove(key);
  }

  /// 清除所有持久化数据
  static Future<bool> clear() async {
    return await _preferences.clear();
  }

  /// 重新加载所有数据,仅重载运行时
  static Future<void> reload() async {
    return await _preferences.reload();
  }

  /// 判断是否是json字符串
  static _isJson(String value) {
    try {
      JsonDecoder().convert(value);
      return true;
    } catch (e) {
      return false;
    }
  }
}
