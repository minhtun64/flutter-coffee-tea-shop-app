import 'package:flutter/material.dart';
import '../../modals/items.dart';
import '../../modals/removeDiacritics.dart';
import '../../values/app_colors.dart';
import '../../values/app_strings.dart';
import '../../values/app_theme.dart';
import 'widgets/order_banner.dart';
// import 'widgets/order_product_widget.dart';
import 'widgets/order_product_tab.dart';
// import 'widgets/order_search.dart';
import 'widgets/order_tabbar.dart';
// import 'package:twicon/twicon.dart';

enum SortOption {
  sortAZ,
  sortZA,
  sortLowToHigh,
  sortHighToLow,
}

final List<ProductItem> searchResult = [];
final List<ProductItem> productItems = [
  ProductItem(
    id: '1',
    name: 'Đường Đen Sữa Đá',
    price: '45000',
    image: 'assets/images/products/coffee/coffee_1_1.jpeg',
    type: 'coffee',
  ),
  ProductItem(
    id: '2',
    name: 'Cà Phê Sữa Đá',
    price: '29000',
    image: 'assets/images/products/coffee/coffee_2_1.jpeg',
    type: 'coffee',
  ),
  ProductItem(
    id: '3',
    name: 'Bạc Sỉu',
    price: '29000',
    image: 'assets/images/products/coffee/coffee_3_1.jpeg',
    type: 'coffee',
  ),
  ProductItem(
    id: '4',
    name: 'Caramel Macchiato Đá',
    price: '55000',
    image: 'assets/images/products/coffee/coffee_4_1.jpeg',
    type: 'coffee',
  ),
  ProductItem(
    id: '5',
    name: 'Latte Nóng',
    price: '55000',
    image: 'assets/images/products/coffee/coffee_5_1.jpeg',
    type: 'coffee',
  ),
  ProductItem(
    id: '5',
    name: 'Latte Nóng',
    price: '55000',
    image: 'assets/images/products/coffee/coffee_5_1.jpeg',
    type: 'coffee',
  ),
  ProductItem(
    id: '5',
    name: 'Latte Nóng',
    price: '55000',
    image: 'assets/images/products/coffee/coffee_5_1.jpeg',
    type: 'coffee',
  ),
  ProductItem(
    id: '5',
    name: 'Latte Nóng',
    price: '55000',
    image: 'assets/images/products/coffee/coffee_5_1.jpeg',
    type: 'coffee',
  ),
  ProductItem(
    id: '5',
    name: 'Latte Nóng',
    price: '55000',
    image: 'assets/images/products/coffee/coffee_5_1.jpeg',
    type: 'coffee',
  ),
  ProductItem(
    id: '5',
    name: 'Latte Nóng',
    price: '55000',
    image: 'assets/images/products/coffee/coffee_5_1.jpeg',
    type: 'coffee',
  ),
  ProductItem(
    id: '5',
    name: 'Latte Nóng',
    price: '55000',
    image: 'assets/images/products/coffee/coffee_5_1.jpeg',
    type: 'coffee',
  ),
  ProductItem(
    id: '5',
    name: 'Latte Nóng',
    price: '55000',
    image: 'assets/images/products/coffee/coffee_5_1.jpeg',
    type: 'coffee',
  ),
  ProductItem(
    id: '5',
    name: 'Latte Nóng',
    price: '55000',
    image: 'assets/images/products/coffee/coffee_5_1.jpeg',
    type: 'coffee',
  ),
  ProductItem(
    id: '5',
    name: 'Latte Nóng',
    price: '55000',
    image: 'assets/images/products/coffee/coffee_5_1.jpeg',
    type: 'coffee',
  ),
  ProductItem(
    id: '5',
    name: 'Latte Nóng',
    price: '55000',
    image: 'assets/images/products/coffee/coffee_5_1.jpeg',
    type: 'coffee',
  ),
  ProductItem(
    id: '5',
    name: 'Latte Nóng',
    price: '55000',
    image: 'assets/images/products/coffee/coffee_5_1.jpeg',
    type: 'coffee',
  ),
  ProductItem(
    id: '5',
    name: 'Latte Nóng',
    price: '55000',
    image: 'assets/images/products/coffee/coffee_5_1.jpeg',
    type: 'coffee',
  ),
  ProductItem(
    id: '5',
    name: 'Latte Nóng',
    price: '55000',
    image: 'assets/images/products/coffee/coffee_5_1.jpeg',
    type: 'coffee',
  ),
  ProductItem(
    id: '1',
    name: 'Trà Xanh',
    price: '25000',
    image: 'assets/images/products/coffee/coffee_3_1.jpeg',
    type: 'tea',
  ),
];

List<ProductItem> teaItems = [
  ProductItem(
    id: '1',
    name: 'Trà Xanh',
    price: '25.000',
    image: 'assets/images/products/coffee/coffee_3_1.jpeg',
    type: 'tea',
  ),
  ProductItem(
    id: '1',
    name: 'Bánh Mì Sandwich',
    price: '30.000',
    image: 'assets/images/products/coffee/coffee_3_1.jpeg',
    type: 'bread',
  ),
  // ... Các sản phẩm trà khác
];

List<ProductItem> breadItems = [
  ProductItem(
    id: '1',
    name: 'Bánh Mì Sandwich',
    price: '30.000',
    image: 'assets/images/products/coffee/coffee_3_1.jpeg',
    type: 'bread',
  ),
  // ... Các sản phẩm bánh khác
];

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  String currentProductType = 'coffee';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: DefaultTabController(
          length: 3,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  pinned: true,
                  // snap: true,
                  floating: true,
                  backgroundColor: AppColors.primaryColor,
                  automaticallyImplyLeading: false,
                  expandedHeight: 180.0,
                  flexibleSpace: const OrderBanner(),
                  bottom: AppBar(
                    // backgroundColor: const Color(0xffF20078),
                    backgroundColor: AppColors.primaryColor,
                    automaticallyImplyLeading: false,
                    title: const SizedBox(
                      height: 45,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: AppStrings.searchProduct,
                          hintStyle: AppTheme.body_Medium_Thin_Grey,
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(Icons.search),
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                    actions: <Widget>[
                      IconButton(
                        icon: const IconTheme(
                            data: IconThemeData(color: Colors.white),
                            child: Icon(
                              Icons.shopping_bag_outlined,
                              size: 32,
                            )),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                const SliverPersistentHeader(
                  delegate: SliverPersistentHeaderDelegateImpl(
                    tabBar: TabBar(
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: AppColors.primaryColor,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: AppColors.primaryColor,
                      indicatorWeight: 4,
                      tabs: [
                        Tab(icon: Icon(Icons.coffee_outlined)),
                        Tab(
                            icon: Icon(Icons.local_drink_outlined
                                // TaiwanIcons.tapioca_milk_tea,
                                // size: 30,
                                )),
                        Tab(icon: Icon(Icons.dining_outlined)),
                      ],
                    ),
                  ),
                  pinned: true,
                ),
              ];
            },
            body: TabBarView(
              children: [
                OrderProductTab(
                  currentProductType: 'coffee',
                ),
                OrderProductTab(
                  currentProductType: 'tea',
                ),
                OrderProductTab(
                  currentProductType: 'bread',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
