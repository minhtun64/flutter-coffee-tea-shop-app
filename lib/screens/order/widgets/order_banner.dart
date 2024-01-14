import 'package:flutter/material.dart';

class OrderBanner extends StatelessWidget {
  const OrderBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Image.asset(
        'assets/images/banners/product_banners/product_banner_1.jpeg',
        fit: BoxFit.fill,
      ),
      stretchModes: const [StretchMode.zoomBackground],
    );
  }
}
