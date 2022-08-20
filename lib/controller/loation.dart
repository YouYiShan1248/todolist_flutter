import 'package:geolocator/geolocator.dart';
class Location{
  late double? latitude;
  late double? longitude;

  Future<void>getCurrentLocation() async {
    try{
      await Geolocator.requestPermission();
      Position? position = await Geolocator.getLastKnownPosition(forceAndroidLocationManager: true);
      //使用getLastKnownPosition方法而不使用getPosition是因为getPosition无法获取回调，
      // 定位有Google服务定位（国内不支持Google服务框架）和GPS定位，GPS定位分为GPS定位和网络定位，forceAndroidLocationManager定义为true，使用Android的GPS定位
      latitude = position?.latitude;
      longitude = position?.longitude;
    }catch(e){
      print(e);
    }
  }
}