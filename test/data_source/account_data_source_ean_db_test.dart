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
    print(response);
  });

  test('fetch account details success', () async {
    final accountDataSource = AccountDataSourceEanDb();
    final response = await accountDataSource.getAccount(
      authToken:
          'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIwYzJjOTE2Zi0zNDIyLTRmZjctODk3Ny00MzU'
          '3ZTczOTBiM2QiLCJpc3MiOiJjb20uZWFuLWRiIiwiaWF0IjoxNzUwMjAxMTA2LCJ'
          'leHAiOjE3ODE3MzcxMDYsImlzQXBpIjoidHJ1ZSJ9.sH8caiWb7BgXe7b1z53HN1'
          '8BErpRWdYuksA5fwY6kDzbrqHqTBqp9V7ee2DFTPsl1Kx4tozY_LKOEeiYksQEmw',
    );

    expect(response, isNotNull);
    expect(response.data, isNotNull);
    expect(response.error, isNull);
    expect(response.data?.balance, isNonZero);
  });
}
