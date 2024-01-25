import 'package:flutter/material.dart';

import '../../../values/app_colors.dart';
import '../../../values/app_strings.dart';
import '../../../values/app_theme.dart';
import '../../delivery_address/delivery_address_screen.dart';

class HomeDeliveryAddressWidget extends StatelessWidget {
  const HomeDeliveryAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            decoration: const BoxDecoration(
              color: AppColors.cardColor,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: const IconTheme(
              data: IconThemeData(
                color: AppColors.primaryColor,
              ),
              child: Icon(
                Icons.delivery_dining_outlined,
                size: 32,
              ),
            )),
        const SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const DeliveryAddressPage()),
            );
          },
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 90,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      AppStrings.deliveryTo,
                      style: AppTheme.body_SuperSmall_Thin,
                    ),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
                Text(
                  'Vinhomes Grand Park - Origami S7.05, phường Long Thạnh Mỹ, thành phố Thủ Đức',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.body_Small_Bold_Black,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
