import 'package:flutter/material.dart';

class OrderSortOption extends StatelessWidget {
  final String title;
  final String option;
  final String selectedOption;
  final ValueChanged<String?> onChanged;

  const OrderSortOption({
    super.key,
    required this.title,
    required this.option,
    required this.selectedOption,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      activeColor: Colors.black,
      title: Text(
        title,
        style: TextStyle(
          color: selectedOption == option ? Colors.black : Colors.grey,
        ),
      ),
      value: selectedOption == option,
      onChanged: (value) {
        onChanged(value == true
            ? option
            : (selectedOption == option ? null : option));
      },
    );
  }
}
