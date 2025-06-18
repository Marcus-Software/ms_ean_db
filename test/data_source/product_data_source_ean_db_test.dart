import 'package:flutter_test/flutter_test.dart';
import 'package:ms_ean_db/ms_ean_db.dart';

void main() {
  test('fetch product with error', () async {
    final productDataSource = ProductDataSourceEanDb();
    final response = await productDataSource.barcodeLookup(
      barcode: '1234567890123',
    );
    print(response);
    expect(response, isNotNull);
    expect(response.data, isNull);
    expect(response.error, isNotNull);
    expect(response.error?.description, isNotEmpty);
    expect(response.error?.code, isNonZero);
  });

  test('fetch product success', () async {
    final productDataSource = ProductDataSourceEanDb();
    final response = await productDataSource.barcodeLookup(
      barcode: '7896051135425',
      authToken:
          'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIwYzJjOTE2Zi0zNDIyLTRmZjctODk3Ny00MzU'
          '3ZTczOTBiM2QiLCJpc3MiOiJjb20uZWFuLWRiIiwiaWF0IjoxNzUwMjAxMTA2LCJleHA'
          'iOjE3ODE3MzcxMDYsImlzQXBpIjoidHJ1ZSJ9.sH8caiWb7BgXe7b1z53HN18BErpRWd'
          'YuksA5fwY6kDzbrqHqTBqp9V7ee2DFTPsl1Kx4tozY_LKOEeiYksQEmw',
    );
    print(response);
    expect(response, isNotNull);
    expect(response.data, isNotNull);
    expect(response.error, isNull);
    expect(response.data?.barcode, '7896051135425');
  }, skip: true);

  test('fetch product error barcode', () async {
    final productDataSource = ProductDataSourceEanDb();
    final response = await productDataSource.barcodeLookup(
      barcode: '7896051135425Err',
      authToken:
          'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIwYzJjOTE2Zi0zNDIyLTRmZjctODk3Ny00MzU'
          '3ZTczOTBiM2QiLCJpc3MiOiJjb20uZWFuLWRiIiwiaWF0IjoxNzUwMjAxMTA2LCJleHA'
          'iOjE3ODE3MzcxMDYsImlzQXBpIjoidHJ1ZSJ9.sH8caiWb7BgXe7b1z53HN18BErpRWd'
          'YuksA5fwY6kDzbrqHqTBqp9V7ee2DFTPsl1Kx4tozY_LKOEeiYksQEmw',
    );

    expect(response, isNotNull);
    expect(response.data, isNull);
    expect(response.error, isNotNull);
    expect(response.error?.code, 400);
    expect(response.error?.description, 'Invalid barcode: 7896051135425Err');
  });
}
