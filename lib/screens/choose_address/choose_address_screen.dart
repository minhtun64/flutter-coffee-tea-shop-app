import 'package:flutter/material.dart';
import 'package:flutter_coffee_tea_shop_app/values/app_strings.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../../models/auto_complete_prediction.dart';
import '../../models/place_auto_complete_response.dart';
import '../../utils/network_utility.dart';
import '../../values/app_colors.dart';
import '../delivery_address/delivery_address_screen.dart';
import '../order/widgets/location_list_tile.dart';

class ChooseAddressPage extends StatefulWidget {
  const ChooseAddressPage({super.key});

  @override
  State<ChooseAddressPage> createState() => _ChooseAddressPageState();
}

class _ChooseAddressPageState extends State<ChooseAddressPage> {
  List<AutocompletePrediction> placePredictions = [];
  final TextEditingController _addressController = TextEditingController();
  // String address = '';

  Position? _currentUserPosition;
  Future _getMyAddressName() async {
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

    placemarkFromCoordinates(
            _currentUserPosition!.latitude, _currentUserPosition!.longitude)
        .then((placemarks) {
      var output = 'No results found.';
      if (placemarks.isNotEmpty) {
        print(placemarks[0].toString());
        output =
            '${placemarks[0].street}, ${placemarks[0].locality}, ${placemarks[0].administrativeArea}, ${placemarks[0].country}';
      }

      // setState(() {
      //   location = output;
      // });
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DeliveryAddressPage(
                deliveryMyLat: _currentUserPosition!.latitude,
                deliveryMyLng: _currentUserPosition!.longitude,
                address: output)),
      );
    });
  }

  void placeAutoComplete(String query) async {
    Uri uri =
        Uri.https('maps.googleapis.com', 'maps/api/place/autocomplete/json', {
      'input': query,
      'key': AppStrings.mapAPIKey,
      'components': 'country:vn',
    });
    String? response = await NetworkUtility.fetchUrl(uri);
    // print(response);
    if (response != null) {
      PlaceAutocompleteResponse result =
          PlaceAutocompleteResponse.parseAutocompleteResult(response);
      if (result.predictions != null) {
        setState(
          () {
            placePredictions = result.predictions!;
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chọn địa chỉ giao hàng',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          Form(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                  controller: _addressController,
                  onChanged: (value) {
                    placeAutoComplete(value);
                  },
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    hintText: 'Vui lòng nhập địa chỉ',
                    prefixIcon: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Icon(Icons.search, color: AppColors.primaryColor),
                    ),
                    filled: true, // Đặt giá trị filled là true để có màu nền
                    fillColor: AppColors.scaffoldBackgroundColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),

                      borderSide:
                          const BorderSide(color: AppColors.primaryColor), //
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        _addressController.clear();
                        placeAutoComplete('');
                        // setState(() {});
                      },
                      icon: const Icon(Icons.clear,
                          size: 20, color: AppColors.primaryColor),
                    ),
                  ) // Chọn màu nền ở đây

                  ),
            ),
          ),
          if (_addressController.text.isEmpty) ...[
            const Divider(
              height: 4,
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: ElevatedButton.icon(
                onPressed: () {
                  _getMyAddressName();
                },
                icon: const Icon(Icons.my_location),
                label: const Text('Sử dụng vị trí hiện tại của tôi'),
              ),
            ),
            const Divider(
              height: 4,
              thickness: 1,
            ),
            const SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Text('Địa chỉ đã lưu',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
          ],
          Expanded(
            child: ListView.builder(
                itemCount: placePredictions.length,
                itemBuilder: ((context, index) => LocationListTile(
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DeliveryAddressPage(
                                  placeId: placePredictions[index].placeId!,
                                  address:
                                      placePredictions[index].description!)),
                        );
                      },
                      location: placePredictions[index].description!,
                    ))),
          ),
        ],
      ),
    );
  }
}
