import 'package:flutter_test/flutter_test.dart';
import 'package:ms_ean_db/ms_ean_db.dart';

void main() {
  test('fetch product with error', () async {
    final productDataSource = ProductDataSourceEanDb();
    final response = await productDataSource.barcodeLookup(
      barcode: '1234567890123',
    );

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
      authToken: 'TOKEN_HERE',
    );

    expect(response, isNotNull);
    expect(response.data, isNotNull);
    expect(response.error, isNull);
    expect(response.data?.barcode, '7896051135425');
  }, skip: true);

  test('fetch product error barcode', () async {
    final productDataSource = ProductDataSourceEanDb();
    final response = await productDataSource.barcodeLookup(
      barcode: '7896051135425Err',
      authToken: 'TOKEN_HERE',
    );

    expect(response, isNotNull);
    expect(response.data, isNull);
    expect(response.error, isNotNull);
    expect(response.error?.code, 400);
    expect(response.error?.description, 'Invalid barcode: 7896051135425Err');
  });
}
