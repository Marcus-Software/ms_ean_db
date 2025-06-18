import 'dart:convert';

import 'package:ms_ean_db/data/product.dart';

class ProductDto extends Product {
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

  factory ProductDto.fromJson(String source) {
    return ProductDto.fromMap(jsonDecode(source));
  }

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

class BarcodeDetailsDto extends BarcodeDetails {
  BarcodeDetailsDto({
    required super.type,
    required super.description,
    required super.country,
  });

  factory BarcodeDetailsDto.fromMap(Map<String, dynamic> map) {
    return BarcodeDetailsDto(
      type: map['type'] as String,
      description: map['description'] as String,
      country: map['country'] as String,
    );
  }

  factory BarcodeDetailsDto.fromJson(String source) =>
      BarcodeDetailsDto.fromMap(jsonDecode(source));

  BarcodeDetails toBarcodeDetails() {
    return BarcodeDetails(
      type: type,
      description: description,
      country: country,
    );
  }
}

class ImageDto extends Image {
  ImageDto({
    required super.url,
    required super.width,
    required super.height,
    super.isCatalog,
  });

  factory ImageDto.fromMap(Map<String, dynamic> map) {
    return ImageDto(
      url: map['url'] as String,
      width: map['width'] as int,
      height: map['height'] as int,
      isCatalog: map['isCatalog'] as bool? ?? false,
    );
  }

  factory ImageDto.fromJson(String source) =>
      ImageDto.fromMap(jsonDecode(source));

  Image toImage() {
    return Image(url: url, width: width, height: height, isCatalog: isCatalog);
  }
}

class CategoryDto extends Category {
  CategoryDto({required super.id, required super.titles});

  factory CategoryDto.fromMap(Map<String, dynamic> map) {
    return CategoryDto(
      id: map['id'] as String,
      titles: TitlesDto.fromMap(map['titles']),
    );
  }

  factory CategoryDto.fromJson(String source) =>
      CategoryDto.fromMap(jsonDecode(source));

  Category toCategory() {
    return Category(id: id, titles: titles);
  }
}

class ManufacturerDto extends Manufacturer {
  ManufacturerDto({required super.titles, super.id, super.wikidataId});

  factory ManufacturerDto.fromMap(Map<String, dynamic> map) {
    return ManufacturerDto(
      titles: TitlesDto.fromMap(map['titles']),
      id: map['id'] as String?,
      wikidataId: map['wikidataId'] as String?,
    );
  }

  factory ManufacturerDto.fromJson(String source) =>
      ManufacturerDto.fromMap(jsonDecode(source));

  Manufacturer toManufacturer() {
    return Manufacturer(titles: titles, id: id, wikidataId: wikidataId);
  }
}

class TitlesDto extends Titles {
  TitlesDto({required super.titles});

  factory TitlesDto.fromMap(Map<String, dynamic> map) {
    return TitlesDto(titles: Map<String, String>.from(map));
  }

  factory TitlesDto.fromJson(String source) =>
      TitlesDto.fromMap(jsonDecode(source));

  Titles toTitles() {
    return Titles(titles: titles);
  }
}
