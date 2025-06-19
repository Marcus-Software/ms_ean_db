import 'package:ms_ean_db/data/data.dart';
import 'package:ms_ean_db/data_source/account_data_source.dart';
import 'package:ms_ean_db/data_source/account_data_source_ean_db.dart';
import 'package:ms_ean_db/data_source/product_data_source.dart';
import 'package:ms_ean_db/data_source/product_data_source_ean_db.dart';

/// Main class for interacting with the EAN-DB API.
///
/// Provides methods to retrieve account information and look up products by barcode.
class EanDb {
  /// Creates a new EanDb instance.
  ///
  /// [token] is the authentication token required for API access.
  EanDb({required this.token}) {
    _accountDataSource = AccountDataSourceEanDb();
    _productDataSource = ProductDataSourceEanDb();
  }

  /// The authentication token used for API requests.
  final String token;

  /// Data source for account-related operations.
  late final AccountDataSource _accountDataSource;

  /// Data source for product-related operations.
  late final ProductDataSource _productDataSource;

  /// Retrieves the user account information.
  ///
  /// Returns a [Response] containing the [Account] information if successful,
  /// or an error if the request fails.
  Future<Response<Account>> getAccount() async {
    return _accountDataSource.getAccount(authToken: token);
  }

  /// Looks up product information by barcode.
  ///
  /// [barcode] is the EAN/UPC barcode to look up.
  ///
  /// Returns a [Response] containing the [Product] information if successful,
  /// or an error if the request fails or the product is not found.
  Future<Response<Product>> barcodeLookup({required String barcode}) async {
    return _productDataSource.barcodeLookup(barcode: barcode, authToken: token);
  }
}
