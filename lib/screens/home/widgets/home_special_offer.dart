import 'package:flutter/material.dart';

import '../../../modals/items.dart';
import '../../../utils/common_widgets/product_card.dart';
import '../../../values/app_strings.dart';
import '../../../values/app_theme.dart';

import '../../order/order_screen.dart'; // Lấy List productItem

class HomeSpecialOffer extends StatelessWidget {
  const HomeSpecialOffer({super.key});

  @override
  Widget build(BuildContext context) {
    List<ProductItem> saleProductItems =
        productItems.where((product) => product.salePrice != '').toList();

    return Column(
      children: [
        Container(
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.specialOffer,
                style: AppTheme.body_Medium_Bold_Black,
              ),
              InkWell(
                  child: Text(
                AppStrings.viewAll,
                style: AppTheme.body_Small_Thin,
              ))
            ],
          ),
        ),
        SizedBox(
          height: 262, // Đặt chiều cao mong muốn của hàng ngang
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: saleProductItems.length,
            itemBuilder: (context, index) {
              final ProductItem item = saleProductItems[index];
              return ProductCard(productItem: item);
            },
          ),
        ),
      ],
    );
  }
}
