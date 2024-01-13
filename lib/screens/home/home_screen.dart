import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../values/app_colors.dart';
import '../../values/app_strings.dart';
import '../../values/app_theme.dart';
import 'widgets/home_delivery_address_widget.dart';

final List<String> sliderBanners = [
  'assets/images/banners/slider_banners/slider_banner_1.jpeg',
  'assets/images/banners/slider_banners/slider_banner_2.jpeg',
  'assets/images/banners/slider_banners/slider_banner_3.jpeg',
  'assets/images/banners/slider_banners/slider_banner_4.jpeg',
  'assets/images/banners/slider_banners/slider_banner_5.jpeg',
];

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
          child: Column(
            children: [
              const HomeDeliveryAddressWidget(),
              const SizedBox(
                height: 24,
              ),
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  pauseAutoPlayOnTouch: true,
                  aspectRatio: 16 / 9, // Tỉ lệ khung hình
                  viewportFraction: 1,
                  // enableInfiniteScroll: true,
                ),
                items: sliderBanners.map((image) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        // width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          // color: Colors.amber,
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage(image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
