import 'package:flutter/material.dart';
import 'package:flutter_coffee_tea_shop_app/values/app_colors.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/store_model.dart';
import '../../utils/helpers/location_helper.dart';
import '../../utils/network_utility.dart';
import '../../values/app_strings.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  Position? _currentUserPosition;
  List<StoreItem> items = [];
  String selectedFilter = '';

  late Future<List<StoreItem>> _getTheDistanceFuture;

  Future<List<StoreItem>> _getTheDistance() async {
    _currentUserPosition = await LocationHelper.getMyLocation();

    return LocationHelper.getStoreListWithDistanceUpdate(
        _currentUserPosition!.latitude, _currentUserPosition!.longitude);
  }

  void _sortItems() {
    if (selectedFilter == 'nearest') {
      items = LocationHelper.sortByDistanceAscending(items);
    } else {
      items = LocationHelper.sortByDistanceDescending(items);
    }
  }

  void _showFilterModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.only(
            bottom: 24,
            top: 8,
            left: 8,
            right: 8,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<String>(
                title: const Text('Gần nhất'),
                value: 'nearest',
                groupValue: selectedFilter,
                onChanged: (value) {
                  setState(() {
                    selectedFilter = value as String;
                    _sortItems();
                    // sortedItems = sortItems(selectedFilter!);
                  });
                  Navigator.pop(context);
                },
              ),
              RadioListTile<String>(
                title: const Text('Xa nhất'),
                value: 'furthest',
                groupValue: selectedFilter,
                onChanged: (value) {
                  setState(() {
                    selectedFilter = value as String;
                    _sortItems();
                    // sortedItems = sortItems(selectedFilter!);
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    _getTheDistanceFuture = _getTheDistance();
    selectedFilter = 'nearest';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, // Thay đổi màu ở đây
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              // color: Theme.of(context).primaryColor,
              gradient: LinearGradient(colors: AppColors.defaultGradient)),
        ),
        title: const Text('Danh sách cửa hàng',
            style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Chọn cửa hàng để xem chỉ đường'),
                SizedBox(
                  width: 4,
                ),
                Icon(Icons.map_outlined),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            FutureBuilder<List<StoreItem>>(
              future: _getTheDistanceFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Nếu đang chờ dữ liệu, hiển thị tiêu đề loading hoặc bạn có thể thực hiện một hành động khác
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError || snapshot.data == null) {
                  // Nếu có lỗi hoặc danh sách rỗng, hiển thị thông báo lỗi hoặc một thông báo khác
                  return const Center(
                    child: Text(
                      'Rất tiếc, có lỗi xảy ra.',
                      style: TextStyle(fontSize: 14),
                    ),
                  );
                } else {
                  // Nếu có dữ liệu, hiển thị danh sách cửa hàng
                  items = snapshot.data!;
                  return Expanded(
                    child: GridView.builder(
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
                          onTap: () => showDirection(items[index]),
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              color: AppColors.cardColor,
                            ),
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                          top: Radius.circular(12)),
                                      child: Image(
                                        height: height * 0.13,
                                        width: width,
                                        image: AssetImage(items[index].image),
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
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showFilterModal(context),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        child: const Icon(Icons.sort_outlined),
      ),
    );
  }

  Future<void> showDirection(StoreItem item) async {
    final Uri url = Uri.parse(
        'https://www.google.com/maps/dir/${_currentUserPosition!.latitude},${_currentUserPosition!.longitude}/${item.lat},${item.lng}?entry=ttu');
    print(url);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
