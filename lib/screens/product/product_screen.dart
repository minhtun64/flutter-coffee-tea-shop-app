import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coffee_tea_shop_app/values/app_theme.dart';
import 'package:intl/intl.dart';

import '../../values/app_colors.dart';
import '../order/order_screen.dart';

final List<String> prodcutImages = [
  'assets/images/products/coffee/coffee_1_1.jpeg',
  'assets/images/products/coffee/coffee_2_1.jpeg',
  'assets/images/products/coffee/coffee_3_1.jpeg',
  'assets/images/products/coffee/coffee_4_1.jpeg',
  'assets/images/products/coffee/coffee_5_1.jpeg',
];

class ProductPage extends StatefulWidget {
  const ProductPage({
    super.key,
    //  required this.id
  });

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  // final String id;
  final priceFormat = NumberFormat.currency(locale: 'vi_VN', symbol: '');
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('Chi tiết sản phẩm',
            style: AppTheme.body_Medium_Bold_White),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              // color: Theme.of(context).primaryColor,
              gradient: LinearGradient(colors: AppColors.defaultGradient)),
        ),
      ),
      body: Container(
        color: AppColors.scaffoldBackgroundColor,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                // padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        pauseAutoPlayOnTouch: true,
                        aspectRatio: 1 / 1,
                        viewportFraction: 1,
                        enableInfiniteScroll: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
                      items: prodcutImages.map((image) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              // width: double.infinity,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
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
                    DotsIndicator(
                      dotsCount: prodcutImages.length,
                      position: currentIndex.toDouble(),
                    ),
                    // ClipRRect(
                    //   borderRadius: BorderRadius.circular(12),
                    //   child: SizedBox(
                    //     // width: double.infinity,
                    //     height: 430,
                    //     child: Image.asset(
                    //       'assets/images/products/coffee/coffee_1_1.jpeg',
                    //       fit: BoxFit.fitHeight,
                    //     ),
                    //   ),
                    // ),
                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            'Đường Đen Sữa',
                            // maxLines: 1,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '45.000 đ',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '55.000 đ',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
