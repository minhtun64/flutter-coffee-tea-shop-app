import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../modals/items.dart';
import '../../values/app_theme.dart';

// ignore: must_be_immutable
class ProductCard extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final ProductItem productItem;

  const ProductCard({Key? key, required this.productItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Định dạng giá thành số có dấu chấm ngắt phần nghìn
    final priceFormat = NumberFormat.currency(locale: 'vi_VN', symbol: '');

    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              height: 172,
              child: Image.asset(
                productItem.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 172,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 2,
                ),
                Text(
                  productItem.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.body_Medium_Bold_Black,
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (productItem.salePrice != '') ...[
                      Text(
                        '${priceFormat.format(int.parse(productItem.salePrice))}đ',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTheme.body_Small_Bold_Red,
                      ),
                      Text(
                        '${priceFormat.format(int.parse(productItem.price))}đ',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTheme.body_Small_Thin_Black_LineThrough,
                      ),
                    ] else ...[
                      Text(
                        '${priceFormat.format(int.parse(productItem.price))}đ',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTheme.body_Small_Bold_Red,
                      ),
                    ]
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
