import 'package:flutter/material.dart';
import '../../models/product_item_model.dart';
import '../../utils/helpers/product_helper.dart';
import '../../values/app_colors.dart';
import 'widgets/product_detail.dart';
import 'widgets/product_floating_bottom.dart';
import 'widgets/product_images_slider.dart';
import 'widgets/product_size_choice.dart';
import 'widgets/product_topping_choice.dart';

class ProductPage extends StatefulWidget {
  final String id;

  const ProductPage({
    super.key,
    required this.id,
    //  required this.id
  });

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String selectedSize = 'M';
  @override
  Widget build(BuildContext context) {
    ProductItem productItem =
        productItems.firstWhere((item) => item.id == widget.id);
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        color: AppColors.scaffoldBackgroundColor,
      ),
      height: MediaQuery.of(context).size.height * 0.94,
      padding: const EdgeInsets.only(top: 12),
      child: Stack(children: [
        Column(children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProductImagesSlider(
                      productImagePaths:
                          ProductHelper.getImagePaths(productItem)),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductDetail(
                            name: productItem.name,
                            descr: productItem.descr,
                            price: ProductHelper.getSizePrice(productItem, 'M'),
                            initialPrice: productItem.initialPrice),
                        ProductSizeChoice(
                          sPrice: ProductHelper.getSizePrice(productItem, 'S'),
                          mPrice: ProductHelper.getSizePrice(productItem, 'M'),
                          lPrice: ProductHelper.getSizePrice(productItem, 'L'),
                          onSizeSelected: (size) {
                            setState(() {
                              selectedSize = size;
                            });
                          },
                        ),
                        const SizedBox(height: 16),
                        const ProductToppingChoice(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          ProductFloatingBottom(
              selectedSize: selectedSize, product: productItem),
        ]),
        Positioned(
          top: 16,
          right: 16,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop(); // Đóng modal
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(Icons.close),
            ),
          ),
        ),
      ]),
    );
  }
}
