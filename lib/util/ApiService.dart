import 'package:app_flutter/util/Constatnt.dart';
import 'package:dio/dio.dart';

class ApiService{
  final Dio _dio ;
  

  ApiService(this._dio);
  Future<Map<String,dynamic>>get({required String endpoint})async{
    _dio.options.receiveDataWhenStatusError = true;
    _dio.options.connectTimeout = const Duration(seconds: 20);
   var responser = await _dio.get('${Constant.baseurl}$endpoint');
  return responser.data;
  }
}