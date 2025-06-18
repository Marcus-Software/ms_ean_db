import 'package:ms_ean_db/data/account.dart';
import 'package:ms_ean_db/data/response.dart';

abstract class AccountDataSource {
  Future<Response<Account>> getAccount({String? authToken});
}
