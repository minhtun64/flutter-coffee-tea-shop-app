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
  // Data data = Data();
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
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, // Thay đổi màu ở đây
        ),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        title: const Text('Danh sách cửa hàng',
            style: AppTheme.body_Medium_Bold_White),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
        child: GridView.builder(
            itemCount: items.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: AppColors.cardColor,
                ),
                padding: const EdgeInsets.only(bottom: 4),
                // height: height * 0.9,
                // width: width * 0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => showDirection(items[index]),
                      child: Column(
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
                          // SizedBox(
                          //   height:
                          //   width: width,
                          //   child: Image.asset(
                          //     items[index].image,
                          //     fit: BoxFit.cover,
                          //   ),
                          // ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              items[index].name,
                              maxLines: 2,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.white,
                          size: 18,
                        ),
                        Text(
                          "${items[index].distance.round()} km",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
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
    // try {
    //   if (await canLaunchUrl(url)) {
    //     await launchUrl(url);
    //   } else {
    //     // Handle the case where the URL cannot be launched
    //     print('Could not launch $url');
    //   }
    // } catch (e) {
    //   // Handle exceptions (e.g., PlatformException)
    //   print('Error launching URL: $e');
    // }
  }
}
