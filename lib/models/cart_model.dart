import 'package:flutter/material.dart';

class CartItem {
  late final int? id;
  final String? productId;
  final String? productName;
  final String? size;
  final double? initialPrice;
  final double? productPrice;
  final ValueNotifier<int>? quantity;
  final String? image;

  CartItem({
    required this.id,
    required this.productId,
    required this.productName,
    required this.size,
    required this.initialPrice,
    required this.productPrice,
    required this.image,
    required this.quantity,
  });

  CartItem.fromMap(Map<dynamic, dynamic> data)
      : id = data['id'],
        productId = data['productId'],
        productName = data['productName'],
        size = data['size'],
        initialPrice = data['initialPrice'],
        productPrice = data['productPrice'],
        quantity = ValueNotifier(data['quantity']),
        image = data['image'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productId': productId,
      'productName': productName,
      'size': size,
      'initialPrice': initialPrice,
      'productPrice': productPrice,
      'quantity': quantity?.value,
      'image': image,
    };
  }

  Map<String, dynamic> quantityMap() {
    return {
      'productId': productId,
      'size': size,
      'quantity': quantity!.value,
    };
  }
}
