import 'package:flutter/material.dart';

import '../../../providers/cart_provider.dart';
import '../../../values/app_colors.dart';

class CartPaymentButton extends StatelessWidget {
  final CartProvider cart;
  final VoidCallback onTap;
  const CartPaymentButton({super.key, required this.cart, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color:
            cart.getCounter() > 0 ? AppColors.primaryColor : Colors.grey[300],
        alignment: Alignment.center,
        height: 80.0,
        child: Text(
          'Tiến hành Thanh toán',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: cart.getCounter() > 0 ? Colors.white : Colors.grey[600],
          ),
        ),
      ),
    );
  }
}
