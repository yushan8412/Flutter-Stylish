import 'package:dio/dio.dart';
import 'data_model.dart';

class ApiService {
  final _dio = Dio();

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
}