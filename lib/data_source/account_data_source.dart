import 'package:ms_ean_db/data/account.dart';
import 'package:ms_ean_db/data/response.dart';

/// Abstract interface for retrieving account information.
///
/// Implementations of this interface provide access to account data
/// from different sources.
abstract class AccountDataSource {
  /// Retrieves account information.
  ///
  /// [authToken] is an optional authentication token for the API.
  ///
  /// Returns a [Response] containing the [Account] information if successful,
  /// or an error if the request fails.
  Future<Response<Account>> getAccount({String? authToken});
}
