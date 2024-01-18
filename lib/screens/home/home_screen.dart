import 'package:flutter/material.dart';

import '../../values/app_colors.dart';
import '../../values/app_theme.dart';
import 'widgets/home_delivery_address_widget.dart';
import 'widgets/home_options.dart';

import 'widgets/home_slider_widget.dart';
import 'widgets/home_special_offer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 40,
                  child: Image.asset(
                    'assets/logo/brilicoffee_logo_outline.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                const Text(
                  'Brili Coffee',
                  style: AppTheme.brand_Large,
                ),
              ],
            ),
            IconButton(
                onPressed: () {},
                icon: const IconTheme(
                  data: IconThemeData(color: Colors.white),
                  child: Icon(Icons.shopping_bag_outlined, size: 32),
                ))
          ],
        ),
        // shadowColor: const Color.fromARGB(255, 175, 29, 243),
        // elevation: 8,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              // color: Theme.of(context).primaryColor,
              gradient: LinearGradient(colors: AppColors.defaultGradient)),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: AppColors.scaffoldBackgroundColor,
          padding: const EdgeInsetsDirectional.all(24),
          child: const Column(
            children: [
              HomeDeliveryAddressWidget(),
              SizedBox(
                height: 24,
              ),
              HomeSliderWidget(),
              SizedBox(
                height: 24,
              ),
              HomeOptions(),
              SizedBox(
                height: 24,
              ),
              HomeSpecialOffer(),
            ],
          ),
        ),
      ),
    );
  }
}
