import 'package:http/http.dart' as http;
import 'package:ms_ean_db/data/dto/dto.dart';
import 'package:ms_ean_db/data/product.dart';
import 'package:ms_ean_db/data/response.dart';
import 'package:ms_ean_db/data_source/product_data_source.dart';

/// Implementation of [ProductDataSource] that retrieves product information
/// from the EAN-DB API.
///
/// Makes HTTP requests to the EAN-DB API to fetch product data by barcode.
class ProductDataSourceEanDb extends ProductDataSource {
  /// Looks up product information by barcode from the EAN-DB API.
  ///
  /// [barcode] is the EAN/UPC barcode to look up.
  /// [authToken] is an optional authentication token for the API. If not provided,
  /// it will use the EAN_DB_API_KEY environment variable.
  ///
  /// Returns a [Response] containing the [Product] information if successful,
  /// or an error if the request fails or the product is not found.
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

    return ResponseDto<ProductDto>.fromJson(
      response.body,
    ).toResponse<Product>();
  }
}
