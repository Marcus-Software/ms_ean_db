import 'package:ms_ean_db/data/product.dart';
import 'package:ms_ean_db/data/response.dart';

/// Abstract interface for retrieving product information.
///
/// Implementations of this interface provide access to product data
/// from different sources.
abstract class ProductDataSource {
  /// Looks up product information by barcode.
  ///
  /// [barcode] is the EAN/UPC barcode to look up.
  /// [authToken] is an optional authentication token for the API.
  ///
  /// Returns a [Response] containing the [Product] information if successful,
  /// or an error if the request fails or the product is not found.
  Future<Response<Product>> barcodeLookup({
    required String barcode,
    String? authToken,
  });
}
