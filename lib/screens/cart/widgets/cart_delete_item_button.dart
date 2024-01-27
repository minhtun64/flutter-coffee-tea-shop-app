import 'package:flutter/material.dart';

class CartDeleteItemButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CartDeleteItemButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Xác nhận xoá',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              content: const Text(
                  'Bạn có chắc chắn muốn xoá sản phẩm này ra khỏi giỏ hàng không?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Đóng hộp thoại
                  },
                  child: const Text('Hủy'),
                ),
                TextButton(
                  onPressed: onPressed,
                  child: const Text('Xoá', style: TextStyle(color: Colors.red)),
                ),
              ],
            );
          },
        );
      },
      icon: const Icon(
        Icons.delete_outline,
        color: Colors.red,
      ),
    );
  }
}
