class ProductItem {
  final String id;
  final String name;
  final String descr;

  final List<ProductImage> images;
  final List<ProductPrice> prices;
  final String type;

  String oriPrice;

  ProductItem({
    required this.id,
    required this.name,
    required this.descr,
    required this.images,
    required this.prices,
    required this.type,
    this.oriPrice = '',
  });
}

class ProductImage {
  final String path;
  bool isMain;

  ProductImage({
    required this.path,
    this.isMain = false,
  });
}

class ProductPrice {
  final String size;
  final String price;

  ProductPrice({
    required this.size,
    required this.price,
  });
}
