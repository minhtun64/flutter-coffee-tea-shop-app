import 'package:flutter/material.dart';

import '../../../modals/items.dart';
import '../../../values/app_colors.dart';
import '../../../values/app_theme.dart';
import '../order_screen.dart';
import '../../../utils/common_widgets/product_card.dart';
import 'order_sort_filter_modal.dart';

// ignore: must_be_immutable
class OrderProductTab extends StatefulWidget {
  final String currentProductType;
  final Function(List<ProductItem>) onSearchResultChanged;
  final bool isSearchTextNotEmpty;
  bool isSortFilterApplied = false;

  List<ProductItem> filteredItems = [];

  OrderProductTab({
    Key? key,
    required this.currentProductType,
    required this.onSearchResultChanged,
    required this.isSearchTextNotEmpty,
  }) : super(key: key);

  @override
  State<OrderProductTab> createState() => _OrderProductTabState();
}

class _OrderProductTabState extends State<OrderProductTab> {
  final GlobalKey _scrollViewKey = GlobalKey();

  List<ProductItem> filterProductByType(
      List<ProductItem> allProducts, String type) {
    return allProducts.where((product) => product.type == type).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<ProductItem> items = [];
    if (!widget.isSortFilterApplied) {
      items = filterProductByType(
        (searchResult.isNotEmpty || widget.isSearchTextNotEmpty)
            ? searchResult
            : productItems,
        widget.currentProductType,
      );
    } else {
      items = filterProductByType(
        widget.filteredItems,
        widget.currentProductType,
      );
    }
    return Scaffold(
      body: Container(
        color: AppColors.scaffoldBackgroundColor,
        child: CustomScrollView(
          key: _scrollViewKey,
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              excludeHeaderSemantics: false,
              floating: true,
              pinned: false, // Giữ nguyên AppBar khi cuộn lên
              expandedHeight: 160,
              // backgroundColor: Colors.amber,
              // actions: [IconButton(onPressed: () {}, icon: Icons.filter_alt)],
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/images/banners/sale_off_banners/sale_off_banner_1.jpeg',
                  fit: BoxFit.cover,
                ),
                stretchModes: const [StretchMode.zoomBackground],
              ),
              bottom: AppBar(
                backgroundColor: Colors.transparent,
                // shadowColor: Colors.grey,
                // elevation: 10,
                automaticallyImplyLeading: false,
                // title: const OrderSearch(),
                actions: <Widget>[
                  InkWell(
                    onTap: () {
                      // Xử lý sự kiện onPress chung cho Text và IconButton ở đây
                      print('Lọc và sắp xếp pressed');
                    },
                    child: const Text(
                      'Lọc và sắp xếp',
                      style: AppTheme.body_Small_Thin_White_Underline,
                    ),
                  ),
                  IconButton(
                    highlightColor: Colors.white10,
                    icon: const IconTheme(
                      data: IconThemeData(
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.filter_alt_outlined,
                      ),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(12))),
                          isScrollControlled: true,
                          // backgroundColor: Colors.grey[300],
                          context: context,
                          builder: (BuildContext context) {
                            return OrderSortFilterModal(
                              productItems: searchResult.isNotEmpty
                                  ? searchResult
                                  : productItems,
                              onFilterApplied: (filteredItems) {
                                setState(() {
                                  widget.filteredItems = filteredItems;
                                  widget.isSortFilterApplied = true;
                                  _scrollToTop();
                                });
                              },
                            );
                          });
                    },
                  )
                ],
              ),
            ),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250.0,
                // mainAxisExtent: 300,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                childAspectRatio: (1 / 1.23),
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  if (items.isNotEmpty || widget.isSearchTextNotEmpty) {
                    final productItem = items[index];
                    return ProductCard(productItem: productItem);
                  } else {
                    return Container();
                  }
                },
                childCount: items.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _scrollToTop() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Cuộn lên trên cùng sau khi frame được vẽ xong
      Scrollable.ensureVisible(
        context,
        alignment:
            0.0, // 0.0 là đầu trên của widget sẽ được đưa ra đầu trên màn hình
        duration: const Duration(milliseconds: 500),
      );
    });
  }
}
