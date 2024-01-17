import 'package:flutter/material.dart';

import '../../../utils/helpers/product_helper.dart';

class ProductSizeChoice extends StatefulWidget {
  final String sPrice;
  final String mPrice;
  final String lPrice;

  const ProductSizeChoice(
      {super.key,
      required this.sPrice,
      required this.mPrice,
      required this.lPrice});

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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Lớn'),
              Text(ProductHelper.formatPrice(widget.lPrice)),
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Vừa'),
              Text(ProductHelper.formatPrice(widget.mPrice)),
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Nhỏ'),
              Text(ProductHelper.formatPrice(widget.sPrice)),
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
