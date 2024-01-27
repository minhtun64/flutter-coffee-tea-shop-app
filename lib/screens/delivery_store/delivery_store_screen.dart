import 'package:flutter/material.dart';
import '../../models/store_model.dart';
import '../../utils/helpers/location_helper.dart';
import '../../utils/helpers/navigation_helper.dart';
import '../../values/app_colors.dart';
import '../../values/app_routes.dart';
import 'widgets/delivery_store_step.dart';
import '../../utils/common_widgets/custom_button.dart';

class DeliveryStorePage extends StatefulWidget {
  final double deliveryLat;
  final double deliveryLng;
  const DeliveryStorePage(
      {super.key, required this.deliveryLat, required this.deliveryLng});

  @override
  State<DeliveryStorePage> createState() => _DeliveryStorePageState();
}

class _DeliveryStorePageState extends State<DeliveryStorePage> {
  late Future<List<StoreItem>> _getStoreFuture;

  @override
  void initState() {
    _getStoreFuture = _processStoreList(
        LocationHelper.getStoreListWithDistanceUpdate(
            widget.deliveryLat, widget.deliveryLng));
    super.initState();
  }

  Future<List<StoreItem>> _processStoreList(
      Future<List<StoreItem>> storeListFuture) async {
    List<StoreItem> storeList = await storeListFuture;

    // Sắp xếp danh sách theo khoảng cách tăng dần
    storeList = LocationHelper.sortByDistanceAscending(storeList);

    // Lọc danh sách cửa hàng theo các tiêu chí khác nếu cần
    storeList = LocationHelper.filterStoresWithinDeliveryRange(storeList);

    return storeList;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Column(
          children: [
            Text(
              'Bạn chọn cửa hàng nhé',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: DeliverStoreStep(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<List<StoreItem>>(
                  future: _getStoreFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // Hiển thị tiêu đề, hoặc một tiện ích chờ khác nếu cần thiết
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      // Xử lý lỗi nếu có
                      return const Center(child: Text('Đã xảy ra lỗi'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      // Hiển thị thông báo không có cửa hàng nếu danh sách rỗng
                      return const Center(
                        child: Text(
                          'Rất tiếc, không có cửa hàng nào gần bạn.',
                          style: TextStyle(fontSize: 14),
                        ),
                      );
                    } else {
                      // Hiển thị danh sách cửa hàng
                      List<StoreItem> items = snapshot.data!;
                      return GridView.builder(
                          itemCount: items.length,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 3 / 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              // onTap: () => showDirection(items[index]),
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  color: AppColors.cardColor,
                                ),
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              const BorderRadius.vertical(
                                                  top: Radius.circular(12)),
                                          child: Image(
                                            height: height * 0.13,
                                            width: width,
                                            image:
                                                AssetImage(items[index].image),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: SizedBox(
                                            width: width,
                                            child: Text(
                                              items[index].name,
                                              maxLines: 2,
                                              textAlign: TextAlign.start,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.primaryColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const Icon(
                                          Icons.location_on,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                        Text(
                                          "${items[index].distance.toStringAsFixed(2)} km",
                                          style: const TextStyle(
                                            fontSize: 16,
                                            // fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    }
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FutureBuilder<List<StoreItem>>(
        future: _getStoreFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CustomButton(
              onPressed: null,
              text: 'Tiếp tục',
              isLoading: true,
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return CustomButton(
              onPressed: () => NavigationHelper.pushReplacementNamed(
                AppRoutes.navigate_home,
              ),
              text: 'Quay lại',
            );
          } else {
            return CustomButton(
              onPressed: () {
                // Xử lý sự kiện khi nút Tiếp tục được nhấn
              },
              text: 'Tiếp tục',
            );
          }
        },
      ),
    );
  }
}
