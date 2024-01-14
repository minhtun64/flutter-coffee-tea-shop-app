class ProductItem {
  final String id;
  final String name;
  final String price;
  final String image;
  final String type;
  String salePrice;

  ProductItem({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.type,
    this.salePrice = '',
  });
}
