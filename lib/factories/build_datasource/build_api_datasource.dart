import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../../external/api/api.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: 'https://caupe-api.herokuapp.com',
    // baseUrl: 'http://192.168.1.11:8080',
    headers: {'x-api-key': getToken()},
  ),
);
Api buildApi() => Api(dio: dio);

String? getToken() => GetStorage().read('token');
