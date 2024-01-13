import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> sliderBanners = [
  'assets/images/banners/slider_banners/slider_banner_1.jpeg',
  'assets/images/banners/slider_banners/slider_banner_2.jpeg',
  'assets/images/banners/slider_banners/slider_banner_3.jpeg',
  'assets/images/banners/slider_banners/slider_banner_4.jpeg',
  'assets/images/banners/slider_banners/slider_banner_5.jpeg',
];

class HomeSliderWidget extends StatelessWidget {
  const HomeSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
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
    );
  }
}
