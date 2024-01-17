import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coffee_tea_shop_app/screens/product/widgets/product_topping_choice.dart';
import 'package:flutter_coffee_tea_shop_app/values/app_theme.dart';
import 'package:intl/intl.dart';

import '../../modals/items.dart';
import '../../utils/common_widgets/expandable_text.dart';
import '../../values/app_colors.dart';
import '../order/order_screen.dart';
import 'widgets/product_detail.dart';
import 'widgets/product_images_slider.dart';
import 'widgets/product_size_choice.dart';

class ProductPage extends StatefulWidget {
  final String id;

  const ProductPage({
    super.key,
    required this.id,
    //  required this.id
  });

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  // final String id;
  final priceFormat = NumberFormat.currency(locale: 'vi_VN', symbol: '');

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
    ProductItem productItem =
        productItems.firstWhere((item) => item.id == widget.id);
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        color: AppColors.scaffoldBackgroundColor,
      ),
      height: MediaQuery.of(context).size.height * 0.94,
      padding: const EdgeInsets.only(top: 12),
      child: Stack(children: [
        Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const ProductImagesSlider(),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProductDetail(
                              name: productItem.name,
                              price: productItem.price,
                              oriPrice: productItem.oriPrice),
                          const ProductSizeChoice(),
                          const SizedBox(height: 16),
                          const ProductToppingChoice(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
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
                        margin: const EdgeInsets.symmetric(horizontal: 16),
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
                  ElevatedButton(
                    onPressed: () {
                      // Xử lý khi nhấn nút "Thêm vào giỏ hàng"
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors
                          .primaryColor, // Màu nền của nút "Thêm vào giỏ hàng"
                    ),
                    child: const Text(
                      'Thêm vào giỏ hàng',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 16,
          right: 16,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop(); // Đóng modal
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(Icons.close),
            ),
          ),
        ),
      ]),
    );
  }
}
