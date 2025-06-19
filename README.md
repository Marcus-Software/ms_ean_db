[![Pub](https://img.shields.io/pub/v/ms_ean_db.svg)](https://pub.dartlang.org/packages/ms_ean_db)
[![GitHub stars](https://img.shields.io/github/stars/Marcus-Software/ms_ean_db?style=social)](https://github.com/Marcus-Software/ms_ean_db)
<span class="badge-buymeacoffee">
<a href="https://www.buymeacoffee.com/marcusedu" title="Donate to this project using Buy Me A Coffee"><img src="https://img.shields.io/badge/buy%20me%20a%20coffee-donate-yellow.svg" alt="Buy Me A Coffee donate button" /></a>
</span>

A simple client of [EAN-DB](https://ean-db.com/) API, a database of EAN codes with more than 64 M barcodes.

## Features

- Search for EAN codes

## Getting started

Create an account at [EAN-DB](https://ean-db.com/) to get your API token.

You can find your API token in your account settings after logging [here](https://ean-db.com/account).

## Usage

To use this package, add `ms_ean_db` as a dependency in your `pubspec.yaml` file.

```shell
flutter pub add ms_ean_db
```

Then, import the package in your Dart code:

```dart
import 'package:ms_ean_db/ms_ean_db.dart';
```

So you can use the `EanDb` class to interact

```dart
void main() async {
  final eanDb = EanDb(token: 'YOUR_API_TOKEN');
  final accountResponse = await eanDb.getAccount();
  print('Account: ${accountResponse.data.primaryEmail}'); // Account: your_nice_email@host.com
  print('Balance: ${accountResponse.data.balance}'); // Balance: 123
  final productResponse = await eanDb.barcodeLookup('7896051135425');
  print(
    'Product: ${productResponse.data?.titles.get('pt')}',
  ); // Output: Product: Manteiga de Primeira Qualidade com Sal
}
```

## Thanks

I would like to thank [EAN-DB](https://ean-db.com/) for providing this API and allowing us to use it in our projects.

I hope this package helps you to easily integrate EAN code search functionality into your Flutter applications.
Consider supporting the project by [buying me a coffee](https://www.buymeacoffee.com/marcusedu) if you find it useful.
