import 'package:flutter/material.dart';
import 'package:flutter_coffee_tea_shop_app/values/app_colors.dart';
import 'package:provider/provider.dart';

import '../../models/cart_model.dart';
import '../../providers/cart_provider.dart';
import '../../utils/helpers/db_helper.dart';
import '../../utils/helpers/product_helper.dart';
import 'widgets/cart_delete_item_button.dart';
import 'widgets/cart_payment_button.dart';
import 'widgets/cart_product_info.dart';
import 'widgets/cart_quantity_button.dart';

class CartPage extends StatefulWidget {
  const CartPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CartPage> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartPage> {
  DBHelper? dbHelper = DBHelper();
  List<bool> tapped = [];
  double totalPrice = 0.0; // Biến state để lưu giá trị tổng tiền

  @override
  void initState() {
    super.initState();
    context.read<CartProvider>().getData();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Giỏ hàng', style: TextStyle(fontSize: 20)),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<CartProvider>(
              builder: (BuildContext context, provider, widget) {
                if (provider.cart.isEmpty) {
                  return const Center(
                      child: Text(
                    'Không có sản phẩm nào',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ));
                } else {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: provider.cart.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: AppColors.cardColor,
                          elevation: 5.0,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                CartProductInfo(cartItem: provider.cart[index]),
                                CartQuantityButton(
                                  cartItem: provider.cart[index],
                                  cart: cart,
                                  dbHelper: dbHelper!,
                                ),
                                CartDeleteItemButton(
                                  onPressed: () {
                                    dbHelper!.deleteCartItem(
                                        provider.cart[index].id!);
                                    provider
                                        .removeItem(provider.cart[index].id!);
                                    provider.removeCounter();
                                    Navigator.of(context)
                                        .pop(); // Đóng hộp thoại
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                }
              },
            ),
          ),
          Consumer<CartProvider>(
            builder: (BuildContext context, value, Widget? child) {
              final ValueNotifier<double> total =
                  ValueNotifier(0); // Khởi tạo giá trị là 0
              for (var element in value.cart) {
                total.value +=
                    (element.productPrice! * element.quantity!.value);
              }
              // Gán giá trị mới cho biến state totalPrice
              totalPrice = total.value;
              return Column(
                children: [
                  ValueListenableBuilder<double>(
                    valueListenable: total,
                    builder: (context, val, child) {
                      return ReusableWidget(
                        title: 'Tổng tiền',
                        value: ProductHelper.formatPrice(val),
                      );
                    },
                  ),
                ],
              );
            },
          )
        ],
      ),
      bottomNavigationBar: CartPaymentButton(
        cart: cart,
        onTap: () {
          if (cart.getCounter() > 0) {
            // Thực hiện thanh toán khi có sản phẩm trong giỏ hàng
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Thanh toán thành công'),
                duration: Duration(seconds: 2),
              ),
            );
          }
          // print(cart.getTotalPrice());
          // print('Tổng tiền: $totalPrice');
        },
      ),
    );
  }
}

class ReusableWidget extends StatelessWidget {
  final String title, value;
  const ReusableWidget({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          Text(
            value.toString(),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
