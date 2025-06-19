/// Represents a product in the EAN-DB system.
///
/// Contains comprehensive information about a product, including its barcode,
/// titles, categories, manufacturer, images, and other metadata.
class Product {
  /// Creates a new Product instance.
  ///
  /// [barcode] is the product's EAN/UPC barcode.
  /// [barcodeDetails] contains additional information about the barcode.
  /// [titles] contains the product's titles in different languages.
  /// [categories] is a list of categories the product belongs to.
  /// [manufacturer] is the product's manufacturer.
  /// [relatedBrands] is a list of brands related to the product.
  /// [images] is a list of product images.
  /// [metadata] contains additional product metadata.
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

  /// The product's EAN/UPC barcode.
  final String barcode;

  /// Additional information about the barcode.
  final BarcodeDetails? barcodeDetails;

  /// The product's titles in different languages.
  final Titles titles;

  /// List of categories the product belongs to.
  final List<Category> categories;

  /// The product's manufacturer.
  final Manufacturer? manufacturer;

  /// List of brands related to the product.
  final List<Manufacturer> relatedBrands;

  /// List of product images.
  final List<Image> images;

  /// Additional product metadata.
  final Map<String, dynamic>? metadata;

  @override
  String toString() {
    return 'Product(barcode: $barcode, titles: $titles, categories: $categories, manufacturer: $manufacturer, relatedBrands: $relatedBrands, images: $images, metadata: $metadata)';
  }

  Map<String, dynamic> toMap() {
    return {
      'barcode': barcode,
      'barcodeDetails': barcodeDetails?.toMap(),
      'titles': titles.toMap(),
      'categories': categories.map((e) => e.toMap()).toList(),
      'manufacturer': manufacturer?.toMap(),
      'relatedBrands': relatedBrands.map((e) => e.toMap()).toList(),
      'images': images.map((e) => e.toMap()).toList(),
      'metadata': metadata,
    };
  }
}

/// Contains detailed information about a barcode.
///
/// Includes the barcode type, description, and country of origin.
class BarcodeDetails {
  /// Creates a new BarcodeDetails instance.
  ///
  /// [type] is the type of barcode (e.g., EAN-13, UPC-A).
  /// [description] is a description of the barcode.
  /// [country] is the country of origin for the barcode.
  BarcodeDetails({
    required this.type,
    required this.description,
    required this.country,
  });

  /// The type of barcode (e.g., EAN-13, UPC-A).
  final String type;

  /// A description of the barcode.
  final String description;

  /// The country of origin for the barcode.
  final String country;

  @override
  String toString() {
    return 'BarcodeDetails{type: $type, description: $description, country: $country}';
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'description': description,
      'country': country,
    };
  }
}

/// Represents an image associated with a product.
///
/// Contains the image URL, dimensions, and a flag indicating if it's a catalog image.
class Image {
  /// Creates a new Image instance.
  ///
  /// [url] is the URL of the image.
  /// [width] is the width of the image in pixels.
  /// [height] is the height of the image in pixels.
  /// [isCatalog] indicates whether this is a catalog image.
  Image({
    required this.url,
    required this.width,
    required this.height,
    this.isCatalog = false,
  });

  /// The URL of the image.
  final String url;

  /// Indicates whether this is a catalog image.
  final bool isCatalog;

  /// The width of the image in pixels.
  final int width;

  /// The height of the image in pixels.
  final int height;

  @override
  String toString() {
    return 'Image{url: $url, isCatalog: $isCatalog, width: $width, height: $height}';
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'isCatalog': isCatalog,
      'width': width,
      'height': height,
    };
  }
}

/// Represents a product category.
///
/// Contains a unique identifier and multilingual titles for the category.
class Category {
  /// Creates a new Category instance.
  ///
  /// [id] is the unique identifier for the category.
  /// [titles] contains the category's titles in different languages.
  Category({required this.id, required this.titles});

  /// The unique identifier for the category.
  final String id;

  /// The category's titles in different languages.
  final Titles titles;

  @override
  String toString() {
    return 'Category{id: $id, titles: $titles}';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titles': titles.toMap(),
    };
  }
}

/// Represents a product manufacturer or brand.
///
/// Contains information about the manufacturer, including multilingual titles
/// and optional identifiers.
class Manufacturer {
  /// Creates a new Manufacturer instance.
  ///
  /// [titles] contains the manufacturer's names in different languages.
  /// [id] is an optional unique identifier for the manufacturer.
  /// [wikidataId] is an optional Wikidata identifier for the manufacturer.
  Manufacturer({required this.titles, this.id, this.wikidataId});

  /// An optional unique identifier for the manufacturer.
  final String? id;

  /// The manufacturer's names in different languages.
  final Titles titles;

  /// An optional Wikidata identifier for the manufacturer.
  final String? wikidataId;

  @override
  String toString() {
    return 'Manufacturer{id: $id, titles: $titles, wikidataId: $wikidataId}';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titles': titles.toMap(),
      'wikidataId': wikidataId,
    };
  }
}

/// Manages multilingual titles for products, categories, and manufacturers.
///
/// Provides methods to retrieve titles in specific languages with fallback options.
class Titles {
  /// Creates a new Titles instance.
  ///
  /// [titles] is a map of language codes to title strings.
  Titles({this.titles = const <String, String>{}});

  /// Map of language codes to title strings.
  final Map<String, String> titles;

  /// Gets the title in the specified language with fallback options.
  ///
  /// [languageCode] is the preferred language code.
  /// [defaultLanguage] is the fallback language if the preferred language is not available.
  /// [fallbackStrategy] determines which title to use if neither the preferred nor
  /// default language is available.
  ///
  /// Returns the title string in the requested language, or null if no title is available.
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

  /// Returns a list of all available language codes.
  ///
  /// This can be used to determine which languages are available for a title.
  List<String> languages() {
    return titles.keys.toList();
  }

  @override
  String toString() {
    return 'Titles{titles: $titles}';
  }

  Map<String, String> toMap() {
    return Map.from(titles);
  }
}

/// Defines strategies for fallback when a requested language is not available.
///
/// Used by the [Titles.get] method to determine which title to return when
/// neither the requested language nor the default language is available.
enum FallbackStrategy { 
  /// Use the first available title.
  first, 

  /// Use the last available title.
  last 
}
