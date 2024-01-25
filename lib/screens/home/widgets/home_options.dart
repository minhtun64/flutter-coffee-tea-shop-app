import 'package:flutter/material.dart';

import '../../../values/app_strings.dart';
import '../../bottomTabsNavigation/bottomTabsNavigation.dart';
import '../../store/store_screen.dart';
import 'home_option_button.dart';

class HomeOptions extends StatelessWidget {
  const HomeOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Bestseller Button
            HomeOptionButton(
              label: AppStrings.bestSeller,
              icon: Icons.star,
              onTap: () {
                // Handle Bestseller button press
                print("Bestseller button pressed");
              },
            ),

            HomeOptionButton(
              label: AppStrings.order,
              icon: Icons.shopping_cart,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          BottomTabsNavigation(currentPageIndex: 1)),
                );
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            HomeOptionButton(
              label: AppStrings.promotion,
              icon: Icons.local_offer,
              onTap: () {
                // Handle Promotion button press
                print("Promotion button pressed");
              },
            ),
            HomeOptionButton(
              label: AppStrings.store,
              icon: Icons.store,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StorePage()),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
