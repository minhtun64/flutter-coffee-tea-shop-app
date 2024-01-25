import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../../models/store_model.dart';
import '../../values/app_colors.dart';

class DeliveryStorePage extends StatefulWidget {
  final double deliveryLat;
  final double deliveryLng;
  const DeliveryStorePage(
      {super.key, required this.deliveryLat, required this.deliveryLng});

  @override
  State<DeliveryStorePage> createState() => _DeliveryStorePageState();
}

class _DeliveryStorePageState extends State<DeliveryStorePage> {
  List<StoreItem> items = storeItems;
  double? distanceImMeter = 0.0;

  Future _getTheDistance() async {
    for (int i = 0; i < items.length; i++) {
      double storelat = items[i].lat;

      double storelng = items[i].lng;

      distanceImMeter = Geolocator.distanceBetween(
        widget.deliveryLat,
        widget.deliveryLng,
        storelat,
        storelng,
      );
      var distance = distanceImMeter?.round().toInt();

      items[i].distance = (distance! / 100);
      setState(() {});
    }
  }

  @override
  void initState() {
    _getTheDistance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text(
              'Bạn chọn cửa hàng nhé',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: _buildDeliveryStep(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                  itemCount: items.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
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
      floatingActionButton: ElevatedButton(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(
              Size(MediaQuery.of(context).size.width * 0.9, 50)),
          backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        onPressed: () {},
        child: const Text(
          'Tiếp tục',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildDeliveryStep() {
    return Row(
      children: [
        _buildStep(1, 'Địa chỉ giao hàng', true),
        Container(
          width: 100,
          height: 0.5,
          color: AppColors.primaryColor,
        ),
        _buildStep(2, 'Cửa hàng giao hàng', true),
      ],
    );
  }

  Widget _buildStep(int number, String text, bool isActive) {
    return Expanded(
      child: Column(
        children: [
          const SizedBox(height: 8),
          SizedBox(
            height: 26,
            child: CircleAvatar(
              backgroundColor: isActive ? AppColors.primaryColor : Colors.grey,
              child: Text(
                number.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: TextStyle(
              color: isActive ? AppColors.primaryColor : Colors.grey,
              // fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
