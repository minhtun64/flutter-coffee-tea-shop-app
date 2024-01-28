import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/cart_provider.dart';
import '../../utils/common_widgets/cart_icon.dart';
import '../../values/app_colors.dart';
import '../../values/app_theme.dart';
import 'widgets/home_delivery_address_widget.dart';
import 'widgets/home_options.dart';

import 'widgets/home_slider_widget.dart';
import 'widgets/home_special_offer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CartProvider _cartProvider;

  @override
  void initState() {
    super.initState();
    _cartProvider = Provider.of<CartProvider>(context, listen: false);
    _initializeData();
  }

  Future<void> _initializeData() async {
    await _cartProvider.getData();
    setState(() {
      // Force a rebuild after data is loaded
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

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
            // CartIcon(counter: cartProvider.getCounter()),
            const CartIcon(),

            // FutureBuilder<List<CartItem>>(
            //     future: _cartProvider.getData(),
            //     builder: (context, snapshot) {
            //       return CartIcon(counter: _cartProvider.getCounter());
            //       // }
            //     })
          ],
        ),
        // s: 8,
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
