import 'package:ms_ean_db/data/data.dart';
import 'package:ms_ean_db/data_source/account_data_source.dart';
import 'package:ms_ean_db/data_source/account_data_source_ean_db.dart';
import 'package:ms_ean_db/data_source/product_data_source.dart';
import 'package:ms_ean_db/data_source/product_data_source_ean_db.dart';

class EanDb {
  EanDb({required this.token}) {
    _accountDataSource = AccountDataSourceEanDb();
    _productDataSource = ProductDataSourceEanDb();
  }

  final String token;
  late final AccountDataSource _accountDataSource;
  late final ProductDataSource _productDataSource;

  Future<Response<Account>> getAccount() async {
    return _accountDataSource.getAccount(authToken: token);
  }

  Future<Response<Product>> barcodeLookup({required String barcode}) async {
    return _productDataSource.barcodeLookup(barcode: barcode, authToken: token);
  }
}
