import 'package:flutter_test/flutter_test.dart';
import 'package:ms_ean_db/data/dto/dto.dart';

void main() {
  group('ResponseDto', () {
    test('parse product response', () {
      final map = {
        "balance": 249,
        "product": {
          "barcode": "7896051135425",
          "barcodeDetails": {
            "description": "GS1 Brasil",
            "type": "EAN-13",
            "country": "br",
          },
          "titles": {
            "pt": "Manteiga de Primeira Qualidade com Sal",
            "es": "Manteiga Itambé 500g",
          },
          "categories": [],
          "manufacturer": {
            "id": null,
            "titles": {"it": "TOP LINE"},
            "wikidataId": null,
          },
          "relatedBrands": [],
          "images": [
            {
              "url":
                  "https://images.ean-db.com/789/605/113/7896051135425/778439e4e13584496451d38bf29facca70f81898bfebbc7add91ffd386c4a89f.jpg",
              "isCatalog": true,
              "width": 1000,
              "height": 1000,
            },
          ],
          "metadata": null,
        },
      };

      final response = ResponseDto<ProductDto>.fromMap(map);

      expect(response.balance, 249);
      expect(response.data?.barcode, '7896051135425');
      expect(response.data?.barcodeDetails?.description, 'GS1 Brasil');
      expect(
        response.data?.titles.get('pt'),
        'Manteiga de Primeira Qualidade com Sal',
      );
      expect(response.data?.titles.get('es'), 'Manteiga Itambé 500g');
      expect(
        response.data?.titles.get('en', defaultLanguage: 'es'),
        'Manteiga Itambé 500g',
      );
      expect(
        response.data?.images.first.url,
        startsWith('https://images.ean-db.com/'),
      );
    });

    test('parse account response', () {
      final map = {
        "account": {"primaryEmail": "marcusedu@hotmail.com", "balance": 248},
      };

      final response = ResponseDto<AccountDto>.fromMap(map);

      expect(response.data?.primaryEmail, 'marcusedu@hotmail.com');
      expect(response.data?.balance, 248);
    });
  });
}
