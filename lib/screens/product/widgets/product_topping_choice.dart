import 'package:flutter/material.dart';

class ProductToppingChoice extends StatefulWidget {
  const ProductToppingChoice({super.key});

  @override
  State<ProductToppingChoice> createState() => _ProductToppingChoiceState();
}

class _ProductToppingChoiceState extends State<ProductToppingChoice> {
  List<String> selectedToppings = []; // List of selected toppings
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Chọn Topping',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        CheckboxListTile(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Kem Phô Mai Macchiato'),
              Text('10.000đ'),
            ],
          ),
          value: selectedToppings.contains('Kem Phô Mai Macchiato'),
          onChanged: (value) {
            setState(() {
              if (value!) {
                selectedToppings.add('Kem Phô Mai Macchiato');
              } else {
                selectedToppings.remove('Kem Phô Mai Macchiato');
              }
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
        ),
        CheckboxListTile(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Thạch Cà Phê'),
              Text('10.000đ'),
            ],
          ),
          value: selectedToppings.contains('Thạch Cà Phê'),
          onChanged: (value) {
            setState(() {
              if (value!) {
                selectedToppings.add('Thạch Cà Phê');
              } else {
                selectedToppings.remove('Thạch Cà Phê');
              }
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
        ),
      ],
    );
  }
}
