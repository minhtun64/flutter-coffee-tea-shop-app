import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../utils/common_widgets/expandable_text.dart';
import '../../../utils/helpers/product_helper.dart';

class ProductDetail extends StatefulWidget {
  final String name;
  final String descr;

  final double price;
  final double initialPrice;

  const ProductDetail(
      {super.key,
      required this.name,
      required this.descr,
      required this.price,
      required this.initialPrice});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final priceFormat = NumberFormat.currency(locale: 'vi_VN', symbol: '');

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.name,
          // maxLines: 1,
          overflow: TextOverflow.clip,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              ProductHelper.formatPrice(widget.price),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (widget.initialPrice != 0) ...[
              Text(
                ProductHelper.formatPrice(widget.initialPrice),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        ExpandableText(
          text: widget.descr,
          maxLines: 2,
        ),
      ],
    );
  }
}
