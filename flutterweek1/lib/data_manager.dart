import 'package:dio/dio.dart';

final dio = Dio();

void getHttp() async {
  final response =
      await dio.get('https://api.appworks-school.tw/api/1.0//products/all');
  print(response);
}
