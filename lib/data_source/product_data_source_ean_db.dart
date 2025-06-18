import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:ms_ean_db/data/dto/dto.dart';
import 'package:ms_ean_db/data/product.dart';
import 'package:ms_ean_db/data/response.dart';
import 'package:ms_ean_db/data_source/product_data_source.dart';

class ProductDataSourceEanDb extends ProductDataSource {
  @override
  Future<Response<Product>> barcodeLookup({
    required String barcode,
    String? authToken,
  }) async {
    final response = await http.get(
      Uri.https('ean-db.com', 'api/v2/product/$barcode'),
      headers: {
        'Authorization':
            'Bearer ${authToken ?? String.fromEnvironment('EAN_DB_API_KEY')}',
        'accept': 'application/json',
      },
    );
    log(response.body);

    return ResponseDto<ProductDto>.fromJson(
      response.body,
    ).toResponse<Product>();
  }
}
