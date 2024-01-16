import 'package:flutter/material.dart';

class ProductSizeChoice extends StatefulWidget {
  const ProductSizeChoice({super.key});

  @override
  State<ProductSizeChoice> createState() => _ProductSizeChoiceState();
}

class _ProductSizeChoiceState extends State<ProductSizeChoice> {
  String selectedSize = 'Medium'; // Default selected size
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Chọn Size',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              '*',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        RadioListTile<String>(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Lớn'),
              Text('50.000đ'),
            ],
          ),
          value: 'Large',
          groupValue: selectedSize,
          onChanged: (value) {
            setState(() {
              selectedSize = value!;
            });
          },
          controlAffinity:
              ListTileControlAffinity.leading, // Đặt radio bên trái
        ),
        RadioListTile<String>(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Vừa'),
              Text('45.000đ'),
            ],
          ),
          value: 'Medium',
          groupValue: selectedSize,
          onChanged: (value) {
            setState(() {
              selectedSize = value!;
            });
          },
          controlAffinity:
              ListTileControlAffinity.leading, // Đặt radio bên trái
        ),
        RadioListTile<String>(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Nhỏ'),
              Text('35.000đ'),
            ],
          ),
          value: 'Small',
          groupValue: selectedSize,
          onChanged: (value) {
            setState(() {
              selectedSize = value!;
            });
          },
          controlAffinity:
              ListTileControlAffinity.leading, // Đặt radio bên trái
        ),
      ],
    );
  }
}
