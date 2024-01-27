import 'package:flutter/material.dart';

import '../../values/app_colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final bool isLoading;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
            Size(MediaQuery.of(context).size.width * 0.9, 50)),
        backgroundColor: MaterialStateProperty.all(
            isLoading ? Colors.grey : AppColors.primaryColor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      onPressed: isLoading ? null : onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: isLoading ? Colors.grey[400] : Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}
