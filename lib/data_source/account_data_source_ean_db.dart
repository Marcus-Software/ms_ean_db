import 'package:http/http.dart' as http;
import 'package:ms_ean_db/data/account.dart';
import 'package:ms_ean_db/data/dto/response_dto.dart';
import 'package:ms_ean_db/data/response.dart';
import 'package:ms_ean_db/data_source/account_data_source.dart';

import '../data/dto/account_dto.dart';

/// Implementation of [AccountDataSource] that retrieves account information
/// from the EAN-DB API.
///
/// Makes HTTP requests to the EAN-DB API to fetch account data.
class AccountDataSourceEanDb extends AccountDataSource {
  /// Retrieves account information from the EAN-DB API.
  ///
  /// [authToken] is an optional authentication token for the API. If not provided,
  /// it will use the EAN_DB_API_KEY environment variable.
  ///
  /// Returns a [Response] containing the [Account] information if successful,
  /// or an error if the request fails.
  @override
  Future<Response<Account>> getAccount({String? authToken}) async {
    final response = await http.get(
      Uri.https('ean-db.com', 'api/v2/account'),
      headers: {
        'Authorization':
            'Bearer ${authToken ?? String.fromEnvironment('EAN_DB_API_KEY')}',
        'accept': 'application/json',
      },
    );

    return ResponseDto<AccountDto>.fromJson(
      response.body,
    ).toResponse<Account>();
  }
}
