import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../modals/items.dart';
import '../../screens/product/product_screen.dart';
import '../../values/app_theme.dart';
import '../helpers/product_helper.dart';

// ignore: must_be_immutable
class ProductCard extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final ProductItem productItem;

  const ProductCard({Key? key, required this.productItem}) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    // Định dạng giá thành số có dấu chấm ngắt phần nghìn
    final priceFormat = NumberFormat.currency(locale: 'vi_VN', symbol: '');

    return InkWell(
      onTap: () => showProductDetailsModal(widget.productItem.id),
      child: Container(
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
                  ProductHelper.getMainImagePath(widget.productItem),
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
                    widget.productItem.name,
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
                      Text(
                        ProductHelper.formatPrice(
                            ProductHelper.getMediumSizePrice(
                                widget.productItem)),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTheme.body_Small_Bold_Red,
                      ),
                      if (widget.productItem.oriPrice != '') ...[
                        Text(
                          ProductHelper.formatPrice(
                              widget.productItem.oriPrice),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTheme.body_Small_Thin_Black_LineThrough,
                        ),
                      ]
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showProductDetailsModal(String id) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
        isScrollControlled: true,
        // backgroundColor: Colors.grey[300],
        context: context,
        builder: (BuildContext context) {
          return ProductPage(id: id);
        });
  }
}
