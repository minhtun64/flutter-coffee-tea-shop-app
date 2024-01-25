import 'package:flutter/material.dart';
import 'package:flutter_coffee_tea_shop_app/values/app_colors.dart';
import 'package:flutter_coffee_tea_shop_app/values/app_theme.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/store_model.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  Position? _currentUserPosition;
  double? distanceImMeter = 0.0;
  List<StoreItem> items = storeItems;

  Future _getTheDistance() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    _currentUserPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(_currentUserPosition!.latitude);
    for (int i = 0; i < items.length; i++) {
      double storelat = items[i].lat;

      double storelng = items[i].lng;

      distanceImMeter = Geolocator.distanceBetween(
        _currentUserPosition!.latitude,
        _currentUserPosition!.longitude,
        storelat,
        storelng,
      );
      var distance = distanceImMeter?.round().toInt();

      items[i].distance = (distance! / 100);
      setState(() {});
    }
  }

  String? selectedFilter;
  List<StoreItem> sortedItems = [];
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
                onChanged: (String? value) {
                  setState(() {
                    selectedFilter = value;
                    sortedItems = sortItems(selectedFilter!);
                  });
                  Navigator.pop(context);
                },
              ),
              RadioListTile<String>(
                title: const Text('Xa nhất'),
                value: 'furthest',
                groupValue: selectedFilter,
                onChanged: (String? value) {
                  setState(() {
                    selectedFilter = value;
                    sortedItems = sortItems(selectedFilter!);
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

  List<StoreItem> sortItems(String filter) {
    // Sắp xếp danh sách items dựa trên lựa chọn
    if (filter == 'nearest') {
      return items..sort((a, b) => a.distance.compareTo(b.distance));
    } else if (filter == 'furthest') {
      return items..sort((a, b) => b.distance.compareTo(a.distance));
    }

    // Nếu lựa chọn không hợp lệ, trả về danh sách không thay đổi
    return items;
  }

  @override
  void initState() {
    _getTheDistance();
    selectedFilter = 'nearest';
    sortedItems = sortItems(selectedFilter!);
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
            Expanded(
              child: GridView.builder(
                  itemCount: sortedItems.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => showDirection(sortedItems[index]),
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
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
                                    image: AssetImage(sortedItems[index].image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: SizedBox(
                                    width: width,
                                    child: Text(
                                      sortedItems[index].name,
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
                                  "${sortedItems[index].distance.toStringAsFixed(2)} km",
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
                  }),
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
