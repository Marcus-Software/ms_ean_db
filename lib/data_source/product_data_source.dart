import 'package:ms_ean_db/data/product.dart';
import 'package:ms_ean_db/data/response.dart';

abstract class ProductDataSource {
  Future<Response<Product>> barcodeLookup({
    required String barcode,
    String? authToken,
  });
}
