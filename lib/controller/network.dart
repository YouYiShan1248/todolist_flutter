import 'package:dio/dio.dart';

class NetworkHelper{
  NetworkHelper({required this.url});
  final String url;

  Future getData()async{
    Response response = await Dio().get(url);
    if(response.statusCode ==200){
      var data = response.data;
      return data;
    }else{
      print(response.statusCode);
    }
  }
}