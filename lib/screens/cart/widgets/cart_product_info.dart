import 'package:flutter/material.dart';

import '../../../models/cart_model.dart';
import '../../../utils/helpers/product_helper.dart';

class CartProductInfo extends StatelessWidget {
  final CartItem cartItem;
  const CartProductInfo({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image(
            height: 80,
            width: 80,
            image: AssetImage(cartItem.image!),
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        SizedBox(
          width: 160,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5.0,
              ),
              RichText(
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                text: TextSpan(
                    text: '${cartItem.productName!} (${cartItem.size})',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ),
              RichText(
                maxLines: 1,
                text: TextSpan(
                    text: ProductHelper.formatPrice(cartItem.productPrice!),
                    style: const TextStyle()),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
