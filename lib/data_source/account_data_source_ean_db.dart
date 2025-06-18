import 'package:http/http.dart' as http;
import 'package:ms_ean_db/data/account.dart';
import 'package:ms_ean_db/data/dto/response_dto.dart';
import 'package:ms_ean_db/data/response.dart';
import 'package:ms_ean_db/data_source/account_data_source.dart';

import '../data/dto/account_dto.dart';

class AccountDataSourceEanDb extends AccountDataSource {
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
    print(response.body);

    return ResponseDto<AccountDto>.fromJson(response.body).toResponse<Account>();
  }
}
