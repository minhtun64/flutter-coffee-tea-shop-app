import 'package:flutter/material.dart';

import '../../../values/app_colors.dart';

class ProductFloatingBottom extends StatefulWidget {
  const ProductFloatingBottom({super.key});

  @override
  State<ProductFloatingBottom> createState() => _ProductFloatingBottomState();
}

class _ProductFloatingBottomState extends State<ProductFloatingBottom> {
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
                // Xử lý khi nhấn nút "Thêm vào giỏ hàng"
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
