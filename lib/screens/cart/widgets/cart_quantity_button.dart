import 'package:flutter/material.dart';

import '../../../models/cart_model.dart';
import '../../../providers/cart_provider.dart';
import '../../../utils/helpers/db_helper.dart';

class CartQuantityButton extends StatelessWidget {
  final CartItem cartItem;
  final CartProvider cart;
  final DBHelper dbHelper;
  const CartQuantityButton(
      {super.key,
      required this.cartItem,
      required this.cart,
      required this.dbHelper});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: cartItem.quantity!,
      builder: (context, val, child) {
        return PlusMinusButtons(
          addQuantity: () {
            cart.addQuantity(cartItem.id!);
            dbHelper
                .updateQuantity(CartItem(
              id: cartItem.id!,
              productId: cartItem.productId,
              productName: cartItem.productName,
              size: cartItem.size,
              initialPrice: cartItem.initialPrice,
              productPrice: cartItem.productPrice,
              quantity: ValueNotifier(cartItem.quantity!.value),
              image: cartItem.image,
            ))
                .then((value) {
              // setState(() {
              //   cart.addTotalPrice(cartItem.productPrice!);
              // });
            });
          },
          deleteQuantity: () {
            cart.deleteQuantity(cartItem.id!);
            // cart.removeTotalPrice(cartItem.productPrice!);
          },
          text: val.toString(),
        );
      },
    );
  }
}

class PlusMinusButtons extends StatelessWidget {
  final VoidCallback deleteQuantity;
  final VoidCallback addQuantity;
  final String text;
  const PlusMinusButtons(
      {Key? key,
      required this.addQuantity,
      required this.deleteQuantity,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: deleteQuantity, icon: const Icon(Icons.remove)),
        Text(text),
        IconButton(onPressed: addQuantity, icon: const Icon(Icons.add)),
      ],
    );
  }
}
