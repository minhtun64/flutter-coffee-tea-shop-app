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
    descr:
        'Nếu chuộng vị cà phê đậm đà, bùng nổ và thích vị đường đen ngọt thơm, Đường Đen Sữa Đá đích thị là thức uống dành cho bạn. Không chỉ giúp bạn tỉnh táo buổi sáng, Đường Đen Sữa Đá còn hấp dẫn đến ngụm cuối cùng bởi thạch cà phê giòn dai, nhai cực cuốn. - Khuấy đều trước khi sử dụng',
    prices: [
      ProductPrice(size: 'S', price: '35000'),
      ProductPrice(size: 'M', price: '45000'),
      ProductPrice(size: 'L', price: '55000'),
    ],
    images: [
      ProductImage(
          path: 'assets/images/products/coffee/coffee_1_1.jpeg', isMain: true),
      ProductImage(path: 'assets/images/products/coffee/coffee_2_1.jpeg'),
    ],
    type: 'coffee',
  ),
  ProductItem(
    id: '2',
    name: 'Cà Phê Sữa Đá',
    descr:
        'Cà phê Đắk Lắk nguyên chất được pha phin truyền thống kết hợp với sữa đặc tạo nên hương vị đậm đà, hài hòa giữa vị ngọt đầu lưỡi và vị đắng thanh thoát nơi hậu vị.',
    prices: [
      ProductPrice(size: 'S', price: '19000'),
      ProductPrice(size: 'M', price: '29000'),
      ProductPrice(size: 'L', price: '39000'),
    ],
    images: [
      ProductImage(
          path: 'assets/images/products/coffee/coffee_2_1.jpeg', isMain: true),
      ProductImage(path: 'assets/images/products/coffee/coffee_3_1.jpeg'),
    ],
    type: 'coffee',
  ),
  ProductItem(
    id: '3',
    name: 'Bạc Sỉu',
    descr:
        'Bạc sỉu chính là "Ly sữa trắng kèm một chút cà phê". Thức uống này rất phù hợp những ai vừa muốn trải nghiệm chút vị đắng của cà phê vừa muốn thưởng thức vị ngọt béo ngậy từ sữa.',
    prices: [
      ProductPrice(size: 'S', price: '12000'),
      ProductPrice(size: 'M', price: '22000'),
      ProductPrice(size: 'L', price: '32000'),
    ],
    images: [
      ProductImage(
          path: 'assets/images/products/coffee/coffee_3_1.jpeg', isMain: true),
      ProductImage(path: 'assets/images/products/coffee/coffee_4_1.jpeg'),
    ],
    type: 'coffee',
    oriPrice: '29000',
  ),
  ProductItem(
    id: '4',
    name: 'Caramel Macchiato Đá',
    descr:
        'Khuấy đều trước khi sử dụng Caramel Macchiato sẽ mang đến một sự ngạc nhiên thú vị khi vị thơm béo của bọt sữa, sữa tươi, vị đắng thanh thoát của cà phê Espresso hảo hạng và vị ngọt đậm của sốt caramel được gói gọn trong một tách cà phê.',
    prices: [
      ProductPrice(size: 'S', price: '38000'),
      ProductPrice(size: 'M', price: '48000'),
      ProductPrice(size: 'L', price: '58000'),
    ],
    images: [
      ProductImage(
          path: 'assets/images/products/coffee/coffee_4_1.jpeg', isMain: true),
      ProductImage(path: 'assets/images/products/coffee/coffee_5_1.jpeg'),
    ],
    type: 'coffee',
    oriPrice: '55000',
  ),
  ProductItem(
    id: '5',
    name: 'Latte Nóng',
    descr:
        'Một sự kết hợp tinh tế giữa vị đắng cà phê Espresso nguyên chất hòa quyện cùng vị sữa nóng ngọt ngào, bên trên là một lớp kem mỏng nhẹ tạo nên một tách cà phê hoàn hảo về hương vị lẫn nhãn quan.',
    prices: [
      ProductPrice(size: 'S', price: '45000'),
      ProductPrice(size: 'M', price: '55000'),
      ProductPrice(size: 'L', price: '65000'),
    ],
    images: [
      ProductImage(
          path: 'assets/images/products/coffee/coffee_5_1.jpeg', isMain: true),
      ProductImage(path: 'assets/images/products/coffee/coffee_1_1.jpeg'),
    ],
    type: 'coffee',
  ),
  ProductItem(
    id: '5',
    name: 'Latte Nóng',
    descr:
        'Một sự kết hợp tinh tế giữa vị đắng cà phê Espresso nguyên chất hòa quyện cùng vị sữa nóng ngọt ngào, bên trên là một lớp kem mỏng nhẹ tạo nên một tách cà phê hoàn hảo về hương vị lẫn nhãn quan.',
    prices: [
      ProductPrice(size: 'S', price: '45000'),
      ProductPrice(size: 'M', price: '55000'),
      ProductPrice(size: 'L', price: '65000'),
    ],
    images: [
      ProductImage(
          path: 'assets/images/products/coffee/coffee_5_1.jpeg', isMain: true),
      ProductImage(path: 'assets/images/products/coffee/coffee_1_1.jpeg'),
    ],
    type: 'coffee',
  ),
  ProductItem(
    id: '5',
    name: 'Latte Nóng',
    descr:
        'Một sự kết hợp tinh tế giữa vị đắng cà phê Espresso nguyên chất hòa quyện cùng vị sữa nóng ngọt ngào, bên trên là một lớp kem mỏng nhẹ tạo nên một tách cà phê hoàn hảo về hương vị lẫn nhãn quan.',
    prices: [
      ProductPrice(size: 'S', price: '45000'),
      ProductPrice(size: 'M', price: '55000'),
      ProductPrice(size: 'L', price: '65000'),
    ],
    images: [
      ProductImage(
          path: 'assets/images/products/coffee/coffee_5_1.jpeg', isMain: true),
      ProductImage(path: 'assets/images/products/coffee/coffee_1_1.jpeg'),
    ],
    type: 'coffee',
  ),
  ProductItem(
    id: '5',
    name: 'Latte Nóng',
    descr:
        'Một sự kết hợp tinh tế giữa vị đắng cà phê Espresso nguyên chất hòa quyện cùng vị sữa nóng ngọt ngào, bên trên là một lớp kem mỏng nhẹ tạo nên một tách cà phê hoàn hảo về hương vị lẫn nhãn quan.',
    prices: [
      ProductPrice(size: 'S', price: '45000'),
      ProductPrice(size: 'M', price: '55000'),
      ProductPrice(size: 'L', price: '65000'),
    ],
    images: [
      ProductImage(
          path: 'assets/images/products/coffee/coffee_5_1.jpeg', isMain: true),
      ProductImage(path: 'assets/images/products/coffee/coffee_1_1.jpeg'),
    ],
    type: 'coffee',
  ),
  ProductItem(
    id: '5',
    name: 'Latte Nóng',
    descr:
        'Một sự kết hợp tinh tế giữa vị đắng cà phê Espresso nguyên chất hòa quyện cùng vị sữa nóng ngọt ngào, bên trên là một lớp kem mỏng nhẹ tạo nên một tách cà phê hoàn hảo về hương vị lẫn nhãn quan.',
    prices: [
      ProductPrice(size: 'S', price: '45000'),
      ProductPrice(size: 'M', price: '55000'),
      ProductPrice(size: 'L', price: '65000'),
    ],
    images: [
      ProductImage(
          path: 'assets/images/products/coffee/coffee_5_1.jpeg', isMain: true),
      ProductImage(path: 'assets/images/products/coffee/coffee_1_1.jpeg'),
    ],
    type: 'coffee',
    oriPrice: '55000',
  ),
  ProductItem(
    id: '5',
    name: 'Latte Nóng',
    descr:
        'Một sự kết hợp tinh tế giữa vị đắng cà phê Espresso nguyên chất hòa quyện cùng vị sữa nóng ngọt ngào, bên trên là một lớp kem mỏng nhẹ tạo nên một tách cà phê hoàn hảo về hương vị lẫn nhãn quan.',
    prices: [
      ProductPrice(size: 'S', price: '45000'),
      ProductPrice(size: 'M', price: '55000'),
      ProductPrice(size: 'L', price: '65000'),
    ],
    images: [
      ProductImage(
          path: 'assets/images/products/coffee/coffee_5_1.jpeg', isMain: true),
      ProductImage(path: 'assets/images/products/coffee/coffee_1_1.jpeg'),
    ],
    type: 'coffee',
  ),
  ProductItem(
    id: '5',
    name: 'Latte Nóng',
    descr:
        'Một sự kết hợp tinh tế giữa vị đắng cà phê Espresso nguyên chất hòa quyện cùng vị sữa nóng ngọt ngào, bên trên là một lớp kem mỏng nhẹ tạo nên một tách cà phê hoàn hảo về hương vị lẫn nhãn quan.',
    prices: [
      ProductPrice(size: 'S', price: '45000'),
      ProductPrice(size: 'M', price: '55000'),
      ProductPrice(size: 'L', price: '65000'),
    ],
    images: [
      ProductImage(
          path: 'assets/images/products/coffee/coffee_5_1.jpeg', isMain: true),
      ProductImage(path: 'assets/images/products/coffee/coffee_1_1.jpeg'),
    ],
    type: 'coffee',
  ),
  ProductItem(
    id: '5',
    name: 'Latte Nóng',
    descr:
        'Một sự kết hợp tinh tế giữa vị đắng cà phê Espresso nguyên chất hòa quyện cùng vị sữa nóng ngọt ngào, bên trên là một lớp kem mỏng nhẹ tạo nên một tách cà phê hoàn hảo về hương vị lẫn nhãn quan.',
    prices: [
      ProductPrice(size: 'S', price: '45000'),
      ProductPrice(size: 'M', price: '55000'),
      ProductPrice(size: 'L', price: '65000'),
    ],
    images: [
      ProductImage(
          path: 'assets/images/products/coffee/coffee_5_1.jpeg', isMain: true),
      ProductImage(path: 'assets/images/products/coffee/coffee_1_1.jpeg'),
    ],
    type: 'coffee',
  ),
  ProductItem(
    id: '5',
    name: 'Latte Nóng',
    descr:
        'Một sự kết hợp tinh tế giữa vị đắng cà phê Espresso nguyên chất hòa quyện cùng vị sữa nóng ngọt ngào, bên trên là một lớp kem mỏng nhẹ tạo nên một tách cà phê hoàn hảo về hương vị lẫn nhãn quan.',
    prices: [
      ProductPrice(size: 'S', price: '45000'),
      ProductPrice(size: 'M', price: '55000'),
      ProductPrice(size: 'L', price: '65000'),
    ],
    images: [
      ProductImage(
          path: 'assets/images/products/coffee/coffee_5_1.jpeg', isMain: true),
      ProductImage(path: 'assets/images/products/coffee/coffee_1_1.jpeg'),
    ],
    type: 'coffee',
  ),
  ProductItem(
    id: '5',
    name: 'Latte Nóng',
    descr:
        'Một sự kết hợp tinh tế giữa vị đắng cà phê Espresso nguyên chất hòa quyện cùng vị sữa nóng ngọt ngào, bên trên là một lớp kem mỏng nhẹ tạo nên một tách cà phê hoàn hảo về hương vị lẫn nhãn quan.',
    prices: [
      ProductPrice(size: 'S', price: '45000'),
      ProductPrice(size: 'M', price: '55000'),
      ProductPrice(size: 'L', price: '65000'),
    ],
    images: [
      ProductImage(
          path: 'assets/images/products/coffee/coffee_5_1.jpeg', isMain: true),
      ProductImage(path: 'assets/images/products/coffee/coffee_1_1.jpeg'),
    ],
    type: 'coffee',
  ),
  ProductItem(
    id: '5',
    name: 'Latte Nóng',
    descr:
        'Một sự kết hợp tinh tế giữa vị đắng cà phê Espresso nguyên chất hòa quyện cùng vị sữa nóng ngọt ngào, bên trên là một lớp kem mỏng nhẹ tạo nên một tách cà phê hoàn hảo về hương vị lẫn nhãn quan.',
    prices: [
      ProductPrice(size: 'S', price: '45000'),
      ProductPrice(size: 'M', price: '55000'),
      ProductPrice(size: 'L', price: '65000'),
    ],
    images: [
      ProductImage(
          path: 'assets/images/products/coffee/coffee_5_1.jpeg', isMain: true),
      ProductImage(path: 'assets/images/products/coffee/coffee_1_1.jpeg'),
    ],
    type: 'coffee',
  ),
  ProductItem(
    id: '5',
    name: 'Latte Nóng',
    descr:
        'Một sự kết hợp tinh tế giữa vị đắng cà phê Espresso nguyên chất hòa quyện cùng vị sữa nóng ngọt ngào, bên trên là một lớp kem mỏng nhẹ tạo nên một tách cà phê hoàn hảo về hương vị lẫn nhãn quan.',
    prices: [
      ProductPrice(size: 'S', price: '45000'),
      ProductPrice(size: 'M', price: '55000'),
      ProductPrice(size: 'L', price: '65000'),
    ],
    images: [
      ProductImage(
          path: 'assets/images/products/coffee/coffee_5_1.jpeg', isMain: true),
      ProductImage(path: 'assets/images/products/coffee/coffee_1_1.jpeg'),
    ],
    type: 'coffee',
  ),
  ProductItem(
    id: '5',
    name: 'Latte Nóng',
    descr:
        'Một sự kết hợp tinh tế giữa vị đắng cà phê Espresso nguyên chất hòa quyện cùng vị sữa nóng ngọt ngào, bên trên là một lớp kem mỏng nhẹ tạo nên một tách cà phê hoàn hảo về hương vị lẫn nhãn quan.',
    prices: [
      ProductPrice(size: 'S', price: '45000'),
      ProductPrice(size: 'M', price: '55000'),
      ProductPrice(size: 'L', price: '65000'),
    ],
    images: [
      ProductImage(
          path: 'assets/images/products/coffee/coffee_5_1.jpeg', isMain: true),
      ProductImage(path: 'assets/images/products/coffee/coffee_1_1.jpeg'),
    ],
    type: 'coffee',
  ),
  ProductItem(
    id: '5',
    name: 'Latte Nóng',
    descr:
        'Một sự kết hợp tinh tế giữa vị đắng cà phê Espresso nguyên chất hòa quyện cùng vị sữa nóng ngọt ngào, bên trên là một lớp kem mỏng nhẹ tạo nên một tách cà phê hoàn hảo về hương vị lẫn nhãn quan.',
    prices: [
      ProductPrice(size: 'S', price: '45000'),
      ProductPrice(size: 'M', price: '55000'),
      ProductPrice(size: 'L', price: '65000'),
    ],
    images: [
      ProductImage(
          path: 'assets/images/products/coffee/coffee_5_1.jpeg', isMain: true),
      ProductImage(path: 'assets/images/products/coffee/coffee_1_1.jpeg'),
    ],
    type: 'coffee',
  ),
  ProductItem(
    id: '6',
    name: 'Trà Đào Cam Sả Nóng',
    descr:
        'Vị thanh ngọt của đào, vị chua dịu của Cam Vàng nguyên vỏ, vị chát của trà đen tươi được ủ mới mỗi 4 tiếng, cùng hương thơm nồng đặc trưng của sả chính là điểm sáng làm nên sức hấp dẫn của thức uống này.',
    prices: [
      ProductPrice(size: 'S', price: '49000'),
      ProductPrice(size: 'M', price: '59000'),
      ProductPrice(size: 'L', price: '69000'),
    ],
    images: [
      ProductImage(
          path: 'assets/images/products/tea/tea_1_1.jpeg', isMain: true),
    ],
    type: 'tea',
  ),
];

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
