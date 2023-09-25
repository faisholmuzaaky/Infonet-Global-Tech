import 'dart:convert';

import '../model/api_return_value.dart';
import '../model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductServices {
  String baseUrl = 'https://dummyjson.com';

  Future<ApiReturnValue<List<ProductModel>>> getAllProducts({
    http.Client? client,
  }) async {
    client ??= http.Client();

    Uri url = Uri.parse('$baseUrl/products');

    var res = await client.get(
      url,
    );

    if (res.statusCode != 200) {
      return ApiReturnValue(message: "Something wrong, please try again");
    }

    var result = jsonDecode(res.body);

    List<ProductModel> products = (result['products'] as Iterable)
        .map((product) => ProductModel.fromJson(product))
        .toList();

    return ApiReturnValue(value: products);
  }
}
