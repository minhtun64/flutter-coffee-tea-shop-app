import 'package:flutter/material.dart';

import '../../../utils/common_widgets/delivery_step.dart';

class DeliverAddressStep extends StatelessWidget {
  const DeliverAddressStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const BuildStep(number: 1, text: 'Địa chỉ giao hàng', isActive: true),
        Container(
          width: 80,
          height: 0.5,
          color: Colors.grey,
        ),
        const BuildStep(number: 2, text: 'Cửa hàng giao hàng', isActive: false),
      ],
    );
  }
}
