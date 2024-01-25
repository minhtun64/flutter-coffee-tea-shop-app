import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

import '../../providers/cart_provider.dart';
import '../../screens/cart/cart_screen.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    if (cartProvider.getCounter() > 0) {
      return badges.Badge(
        position: badges.BadgePosition.topEnd(top: 0, end: 0),
        badgeContent: Consumer<CartProvider>(
          builder: (context, value, child) {
            return Text(
              value.getCounter().toString(),
              style: const TextStyle(
                color: Colors.white,
                // fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
        badgeAnimation: const badges.BadgeAnimation.scale(
          animationDuration: Duration(seconds: 1),
          colorChangeAnimationDuration: Duration(seconds: 1),
          loopAnimation: false,
          curve: Curves.fastOutSlowIn,
          colorChangeAnimationCurve: Curves.easeInCubic,
        ),
        child: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartPage()),
            );
          },
          icon: const IconTheme(
            data: IconThemeData(color: Colors.white),
            child: Icon(Icons.shopping_bag_outlined, size: 32),
          ),
        ),
      );
    } else {
      // Không có sản phẩm trong giỏ, chỉ hiển thị icon
      return IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CartPage()),
          );
        },
        icon: const IconTheme(
          data: IconThemeData(color: Colors.white),
          child: Icon(Icons.shopping_bag_outlined, size: 32),
        ),
      );
    }
  }
}
