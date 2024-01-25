import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/cart_model.dart';
import '../../../models/product_item_model.dart';
import '../../../providers/cart_provider.dart';
import '../../../utils/helpers/db_helper.dart';
import '../../../utils/helpers/product_helper.dart';
import '../../../values/app_colors.dart';

class ProductFloatingBottom extends StatefulWidget {
  final String selectedSize;
  final ProductItem product;
  const ProductFloatingBottom(
      {super.key, required this.selectedSize, required this.product});

  @override
  State<ProductFloatingBottom> createState() => _ProductFloatingBottomState();
}

class _ProductFloatingBottomState extends State<ProductFloatingBottom> {
  DBHelper dbHelper = DBHelper();
  int quantity = 1;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    void saveData(ProductItem item) async {
      // Kiểm tra xem sản phẩm đã tồn tại trong giỏ hàng hay chưa
      final existingCartItem =
          await dbHelper.getCartId(item.id, widget.selectedSize);

      if (existingCartItem.isNotEmpty) {
        // Nếu tồn tại, thực hiện truy vấn update
        for (var existingItem in existingCartItem) {
          existingItem.quantity!.value += quantity;
          dbHelper.updateQuantity(existingItem);
          // cart.addTotalPrice(
          //     ProductHelper.getSizePrice(item, widget.selectedSize * quantity));
          print('Product quantity updated in cart');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Đã thêm vào giỏ hàng'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      } else {
        // Nếu không tồn tại, thực hiện truy vấn insert
        dbHelper
            .insert(
          CartItem(
            id: null, // cartItemId sẽ tự động được tạo
            productId: item.id,
            productName: item.name,
            size: widget.selectedSize,
            initialPrice: item.initialPrice,
            productPrice: ProductHelper.getSizePrice(item, widget.selectedSize),
            quantity: ValueNotifier(quantity),
            image: ProductHelper.getMainImagePath(item),
          ),
        )
            .then((value) {
          // cart.addTotalPrice(
          //     ProductHelper.getSizePrice(item, widget.selectedSize) * quantity);
          cart.addCounter();
          print('Product Added to cart');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Đã thêm vào giỏ hàng'),
              duration: Duration(seconds: 2),
            ),
          );
        }).onError((error, stackTrace) {
          print(error.toString());
        });
      }
    }

    return Container(
      padding: const EdgeInsets.only(
        bottom: 32,
        top: 16,
        right: 16,
        left: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white, // Màu nền của hàng nút
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.cardColor, // Màu của nút tăng/giảm
                ),
                child: IconButton(
                  onPressed: decrementQuantity,
                  icon: const Icon(
                    Icons.remove,
                    color: Colors.white,
                    // size: 14, // Màu của biểu tượng "+"
                  ),
                ),
              ),
              Container(
                width: 60,
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.grey,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(4))),
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  '$quantity', // Hiển thị số lượng sản phẩm
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.cardColor, // Màu của nút tăng/giảm
                ),
                child: IconButton(
                  onPressed: incrementQuantity,
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white, // Màu của biểu tượng "-"
                    // size: 14,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 60,
            child: ElevatedButton(
              onPressed: () {
                //   Provider.of<CartProvider>(context, listen: false).addToCart(
                //     widget.product,
                //     widget.selectedSize,
                //     quantity,
                //   );
                saveData(widget.product);
                Navigator.of(context).pop(); // Đóng modal
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors
                    .primaryColor, // Màu nền của nút "Thêm vào giỏ hàng"
              ),
              child: const Text(
                'Thêm vào giỏ hàng',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
