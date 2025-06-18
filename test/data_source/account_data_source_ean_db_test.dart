import 'package:flutter_test/flutter_test.dart';
import 'package:ms_ean_db/data_source/account_data_source_ean_db.dart';

void main() {
  test('fetch account details with erro no token', () async {
    final accountDataSource = AccountDataSourceEanDb();
    final response = await accountDataSource.getAccount();
    expect(response, isNotNull);
    expect(response.data, isNull);
    expect(response.error, isNotNull);
    expect(response.error?.description, isNotEmpty);
    expect(response.error?.code, isNonZero);
  });

  test('fetch account details success', () async {
    final accountDataSource = AccountDataSourceEanDb();
    final response = await accountDataSource.getAccount();

    expect(response, isNotNull);
    expect(response.data, isNotNull);
    expect(response.error, isNull);
    expect(response.data?.balance, isNonZero);
  });
}
