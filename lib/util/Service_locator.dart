import 'package:app_flutter/Feature/data/repo/Homerepoimple.dart';
import 'package:app_flutter/util/ApiService.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  GetIt.I
      .registerSingleton<Homerepoimple>(Homerepoimple(getIt.get<ApiService>()));
}
