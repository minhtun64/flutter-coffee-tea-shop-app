import 'package:flutter/material.dart';

import '../../../values/app_colors.dart';
import '../../../values/app_theme.dart';

class HomeOptionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const HomeOptionButton({
    Key? key,
    required this.label,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width / 2 - 32,
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0.0, 2.0),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(12.0),
              child: Icon(
                icon,
                color: AppColors.primaryColor,
                size: 32.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              label,
              style: AppTheme.body_Small_Bold,
            ),
          ],
        ),
      ),
    );
  }
}
