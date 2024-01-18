import 'package:flutter/material.dart';
import '../../models/product_item_model.dart';
import '../../utils/helpers/removeDiacritics.dart';
import '../../values/app_colors.dart';
import '../../values/app_strings.dart';
import '../../values/app_theme.dart';
import 'widgets/order_banner.dart';
// import 'widgets/order_product_widget.dart';
import 'widgets/order_product_tab.dart';
// import 'widgets/order_search.dart';
import 'widgets/order_tabbar.dart';

enum SortOption {
  sortAZ,
  sortZA,
  sortLowToHigh,
  sortHighToLow,
}

final List<ProductItem> searchResult = [];

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final TextEditingController _searchController = TextEditingController();

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
                    title: SizedBox(
                      height: 45,
                      child: TextField(
                        controller: _searchController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: AppStrings.searchProduct,
                          hintStyle: AppTheme.body_Medium_Thin_Grey,
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(Icons.search),
                          contentPadding: EdgeInsets.zero,
                        ),
                        onChanged: onSearchTextChanged,
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
                  onSearchResultChanged: onSearchResultChanged,
                  isSearchTextNotEmpty: _searchController.text.isNotEmpty,
                ),
                OrderProductTab(
                  currentProductType: 'tea',
                  onSearchResultChanged: onSearchResultChanged,
                  isSearchTextNotEmpty: _searchController.text.isNotEmpty,
                ),
                OrderProductTab(
                  currentProductType: 'bread',
                  onSearchResultChanged: onSearchResultChanged,
                  isSearchTextNotEmpty: _searchController.text.isNotEmpty,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onSearchTextChanged(String text) async {
    searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    final normalizedText = removeDiacritics(text.toLowerCase());

    for (var item in productItems) {
      final normalizedItemName = removeDiacritics(item.name.toLowerCase());
      if (normalizedItemName.contains(normalizedText)) {
        searchResult.add(item);
      }
    }
    setState(() {});
  }

  void onSearchResultChanged(List<ProductItem> searchResults) {
    setState(() {});
  }
}
