import 'dart:convert';

import 'package:ms_ean_db/data/product.dart';

/// Data Transfer Object for [Product].
///
/// Extends [Product] and adds serialization/deserialization functionality.
class ProductDto extends Product {
  /// Creates a new ProductDto instance.
  ///
  /// [barcode] is the product's EAN/UPC barcode.
  /// [barcodeDetails] contains additional information about the barcode.
  /// [titles] contains the product's titles in different languages.
  /// [categories] is a list of categories the product belongs to.
  /// [manufacturer] is the product's manufacturer.
  /// [relatedBrands] is a list of brands related to the product.
  /// [images] is a list of product images.
  /// [metadata] contains additional product metadata.
  ProductDto({
    required super.barcode,
    super.barcodeDetails,
    required super.titles,
    super.categories,
    super.manufacturer,
    super.relatedBrands,
    super.images,
    super.metadata,
  });

  /// Creates a ProductDto from a map.
  ///
  /// [map] is a map containing the product data.
  ///
  /// Returns a new ProductDto instance.
  factory ProductDto.fromMap(Map<String, dynamic> map) {
    return ProductDto(
      barcode: map['barcode'] as String,
      barcodeDetails: map['barcodeDetails'] != null
          ? BarcodeDetailsDto.fromMap(map['barcodeDetails'])
          : null,
      titles: TitlesDto.fromMap(map['titles']),
      categories:
          (map['categories'] as List?)
              ?.map((e) => CategoryDto.fromMap(e))
              .toList() ??
          [],
      manufacturer: map['manufacturer'] != null
          ? ManufacturerDto.fromMap(map['manufacturer'])
          : null,
      relatedBrands:
          (map['relatedBrands'] as List?)
              ?.map((e) => ManufacturerDto.fromMap(e))
              .toList() ??
          [],
      images:
          (map['images'] as List?)?.map((e) => ImageDto.fromMap(e)).toList() ??
          [],
      metadata: map['metadata'],
    );
  }

  /// Creates a ProductDto from a JSON string.
  ///
  /// [source] is a JSON string containing the product data.
  ///
  /// Returns a new ProductDto instance.
  factory ProductDto.fromJson(String source) {
    return ProductDto.fromMap(jsonDecode(source));
  }

  /// Converts this ProductDto to a Product.
  ///
  /// Returns a new Product instance with the same data.
  Product toProduct() {
    return Product(
      barcode: barcode,
      barcodeDetails: (barcodeDetails as BarcodeDetailsDto?)
          ?.toBarcodeDetails(),
      titles: (titles as TitlesDto).toTitles(),
      categories: categories
          .map((e) => (e as CategoryDto).toCategory())
          .toList(),
      manufacturer: (manufacturer as ManufacturerDto?)?.toManufacturer(),
      relatedBrands: relatedBrands
          .map((e) => (e as ManufacturerDto).toManufacturer())
          .toList(),
      images: images.map((e) => (e as ImageDto).toImage()).toList(),
      metadata: metadata,
    );
  }
}

/// Data Transfer Object for [BarcodeDetails].
///
/// Extends [BarcodeDetails] and adds serialization/deserialization functionality.
class BarcodeDetailsDto extends BarcodeDetails {
  /// Creates a new BarcodeDetailsDto instance.
  ///
  /// [type] is the type of barcode (e.g., EAN-13, UPC-A).
  /// [description] is a description of the barcode.
  /// [country] is the country of origin for the barcode.
  BarcodeDetailsDto({
    required super.type,
    required super.description,
    required super.country,
  });

  /// Creates a BarcodeDetailsDto from a map.
  ///
  /// [map] is a map containing the barcode details data with keys 'type', 'description', and 'country'.
  ///
  /// Returns a new BarcodeDetailsDto instance.
  factory BarcodeDetailsDto.fromMap(Map<String, dynamic> map) {
    return BarcodeDetailsDto(
      type: map['type'] as String,
      description: map['description'] as String,
      country: map['country'] as String,
    );
  }

  /// Creates a BarcodeDetailsDto from a JSON string.
  ///
  /// [source] is a JSON string containing the barcode details data.
  ///
  /// Returns a new BarcodeDetailsDto instance.
  factory BarcodeDetailsDto.fromJson(String source) =>
      BarcodeDetailsDto.fromMap(jsonDecode(source));

  /// Converts this BarcodeDetailsDto to a BarcodeDetails.
  ///
  /// Returns a new BarcodeDetails instance with the same data.
  BarcodeDetails toBarcodeDetails() {
    return BarcodeDetails(
      type: type,
      description: description,
      country: country,
    );
  }
}

/// Data Transfer Object for [Image].
///
/// Extends [Image] and adds serialization/deserialization functionality.
class ImageDto extends Image {
  /// Creates a new ImageDto instance.
  ///
  /// [url] is the URL of the image.
  /// [width] is the width of the image in pixels.
  /// [height] is the height of the image in pixels.
  /// [isCatalog] indicates whether this is a catalog image.
  ImageDto({
    required super.url,
    required super.width,
    required super.height,
    super.isCatalog,
  });

  /// Creates an ImageDto from a map.
  ///
  /// [map] is a map containing the image data with keys 'url', 'width', 'height', and optionally 'isCatalog'.
  ///
  /// Returns a new ImageDto instance.
  factory ImageDto.fromMap(Map<String, dynamic> map) {
    return ImageDto(
      url: map['url'] as String,
      width: map['width'] as int,
      height: map['height'] as int,
      isCatalog: map['isCatalog'] as bool? ?? false,
    );
  }

  /// Creates an ImageDto from a JSON string.
  ///
  /// [source] is a JSON string containing the image data.
  ///
  /// Returns a new ImageDto instance.
  factory ImageDto.fromJson(String source) =>
      ImageDto.fromMap(jsonDecode(source));

  /// Converts this ImageDto to an Image.
  ///
  /// Returns a new Image instance with the same data.
  Image toImage() {
    return Image(url: url, width: width, height: height, isCatalog: isCatalog);
  }
}

/// Data Transfer Object for [Category].
///
/// Extends [Category] and adds serialization/deserialization functionality.
class CategoryDto extends Category {
  /// Creates a new CategoryDto instance.
  ///
  /// [id] is the unique identifier for the category.
  /// [titles] contains the category's titles in different languages.
  CategoryDto({required super.id, required super.titles});

  /// Creates a CategoryDto from a map.
  ///
  /// [map] is a map containing the category data with keys 'id' and 'titles'.
  ///
  /// Returns a new CategoryDto instance.
  factory CategoryDto.fromMap(Map<String, dynamic> map) {
    return CategoryDto(
      id: map['id'] as String,
      titles: TitlesDto.fromMap(map['titles']),
    );
  }

  /// Creates a CategoryDto from a JSON string.
  ///
  /// [source] is a JSON string containing the category data.
  ///
  /// Returns a new CategoryDto instance.
  factory CategoryDto.fromJson(String source) =>
      CategoryDto.fromMap(jsonDecode(source));

  /// Converts this CategoryDto to a Category.
  ///
  /// Returns a new Category instance with the same data.
  Category toCategory() {
    return Category(id: id, titles: titles);
  }
}

/// Data Transfer Object for [Manufacturer].
///
/// Extends [Manufacturer] and adds serialization/deserialization functionality.
class ManufacturerDto extends Manufacturer {
  /// Creates a new ManufacturerDto instance.
  ///
  /// [titles] contains the manufacturer's names in different languages.
  /// [id] is an optional unique identifier for the manufacturer.
  /// [wikidataId] is an optional Wikidata identifier for the manufacturer.
  ManufacturerDto({required super.titles, super.id, super.wikidataId});

  /// Creates a ManufacturerDto from a map.
  ///
  /// [map] is a map containing the manufacturer data with keys 'titles', 'id', and 'wikidataId'.
  ///
  /// Returns a new ManufacturerDto instance.
  factory ManufacturerDto.fromMap(Map<String, dynamic> map) {
    return ManufacturerDto(
      titles: TitlesDto.fromMap(map['titles']),
      id: map['id'] as String?,
      wikidataId: map['wikidataId'] as String?,
    );
  }

  /// Creates a ManufacturerDto from a JSON string.
  ///
  /// [source] is a JSON string containing the manufacturer data.
  ///
  /// Returns a new ManufacturerDto instance.
  factory ManufacturerDto.fromJson(String source) =>
      ManufacturerDto.fromMap(jsonDecode(source));

  /// Converts this ManufacturerDto to a Manufacturer.
  ///
  /// Returns a new Manufacturer instance with the same data.
  Manufacturer toManufacturer() {
    return Manufacturer(titles: titles, id: id, wikidataId: wikidataId);
  }
}

/// Data Transfer Object for [Titles].
///
/// Extends [Titles] and adds serialization/deserialization functionality.
class TitlesDto extends Titles {
  /// Creates a new TitlesDto instance.
  ///
  /// [titles] is a map of language codes to title strings.
  TitlesDto({required super.titles});

  /// Creates a TitlesDto from a map.
  ///
  /// [map] is a map of language codes to title strings.
  ///
  /// Returns a new TitlesDto instance.
  factory TitlesDto.fromMap(Map<String, dynamic> map) {
    return TitlesDto(titles: Map<String, String>.from(map));
  }

  /// Creates a TitlesDto from a JSON string.
  ///
  /// [source] is a JSON string containing a map of language codes to title strings.
  ///
  /// Returns a new TitlesDto instance.
  factory TitlesDto.fromJson(String source) =>
      TitlesDto.fromMap(jsonDecode(source));

  /// Converts this TitlesDto to a Titles.
  ///
  /// Returns a new Titles instance with the same data.
  Titles toTitles() {
    return Titles(titles: titles);
  }
}
