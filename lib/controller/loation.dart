import 'package:geolocator/geolocator.dart';
class Location{
  late double? latitude;
  late double? longitude;

  Future<void>getCurrentLocation() async {
    try{
      await Geolocator.requestPermission();
      Position? position = await Geolocator.getLastKnownPosition(forceAndroidLocationManager: true);
      latitude = position?.latitude;
      longitude = position?.longitude;
      print('--------------------------');
      print(latitude);
      print(longitude);
      print('--------------------------');
    }catch(e){
      print(e);
    }

  }
}