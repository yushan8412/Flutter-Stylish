import 'package:dio/dio.dart';
import 'data_model.dart';

class ApiService {
  final _dio = Dio();
  List<Product> womanItems = [];

  Future<List<Product>> fetchAllProducts(String key) async {
    try {
      final response = await _dio
          .get('https://api.appworks-school.tw/api/1.0/products/$key');
      final products = (response.data['data'] as List<dynamic>)
          .map((productData) => Product.fromJson(productData))
          .toList();
      return products;
    } catch (error) {
      throw error;
    }
  }

  // Future<List<Product>> fetchAllProducts(List<Product> itemsList) async {
  //   try {
  //     final response =
  //         await _dio.get('https://api.appworks-school.tw/api/1.0/products/all');
  //     itemsList = (response.data['data'] as List<dynamic>)
  //         .map((productData) => Product.fromJson(productData))
  //         .toList();
  //     return itemsList;
  //   } catch (error) {
  //     throw error;
  //   }
  // }
}
// void getHttp() async {
//   final response =
//       await _dio.get('https://api.appworks-school.tw/api/1.0//products/all');
//   print(response);
// }
