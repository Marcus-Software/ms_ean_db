class Product {
  Product({
    required this.barcode,
    this.barcodeDetails,
    required this.titles,
    this.categories = const [],
    this.manufacturer,
    this.relatedBrands = const [],
    this.images = const [],
    this.metadata,
  });

  final String barcode;
  final BarcodeDetails? barcodeDetails;
  final Titles titles;
  final List<Category> categories;
  final Manufacturer? manufacturer;
  final List<Manufacturer> relatedBrands;
  final List<Image> images;
  final Map<String, dynamic>? metadata;

  @override
  String toString() {
    return 'Product(barcode: $barcode, titles: $titles, categories: $categories, manufacturer: $manufacturer, relatedBrands: $relatedBrands, images: $images, metadata: $metadata)';
  }
}

class BarcodeDetails {
  BarcodeDetails({
    required this.type,
    required this.description,
    required this.country,
  });

  final String type;
  final String description;
  final String country;

  @override
  String toString() {
    return 'BarcodeDetails{type: $type, description: $description, country: $country}';
  }
}

class Image {
  Image({
    required this.url,
    required this.width,
    required this.height,
    this.isCatalog = false,
  });

  final String url;
  final bool isCatalog;
  final int width;
  final int height;

  @override
  String toString() {
    return 'Image{url: $url, isCatalog: $isCatalog, width: $width, height: $height}';
  }
}

class Category {
  Category({required this.id, required this.titles});

  final String id;
  final Titles titles;

  @override
  String toString() {
    return 'Category{id: $id, titles: $titles}';
  }
}

class Manufacturer {
  Manufacturer({required this.titles, this.id, this.wikidataId});

  final String? id;
  final Titles titles;
  final String? wikidataId;

  @override
  String toString() {
    return 'Manufacturer{id: $id, titles: $titles, wikidataId: $wikidataId}';
  }
}

class Titles {
  Titles({this.titles = const <String, String>{}});

  final Map<String, String> titles;

  String? get(
    String languageCode, {
    String defaultLanguage = 'en',
    FallbackStrategy fallbackStrategy = FallbackStrategy.first,
  }) {
    return titles[languageCode] ??
        titles[defaultLanguage] ??
        (fallbackStrategy == FallbackStrategy.first
            ? titles.values.firstOrNull
            : titles.values.lastOrNull);
  }

  List<String> languages() {
    return titles.keys.toList();
  }

  @override
  String toString() {
    return 'Titles{titles: $titles}';
  }
}

enum FallbackStrategy { first, last }
