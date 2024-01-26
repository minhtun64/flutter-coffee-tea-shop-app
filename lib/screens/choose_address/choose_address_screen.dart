import 'package:flutter/material.dart';
import 'package:flutter_coffee_tea_shop_app/values/app_strings.dart';

import '../../models/auto_complete_prediction.dart';
import '../../models/place_auto_complete_response.dart';
import '../../utils/network_utility.dart';
import '../order/widgets/location_list_tile.dart';

class ChooseAddressPage extends StatefulWidget {
  const ChooseAddressPage({super.key});

  @override
  State<ChooseAddressPage> createState() => _ChooseAddressPageState();
}

class _ChooseAddressPageState extends State<ChooseAddressPage> {
  List<AutocompletePrediction> placePredictions = [];
  final TextEditingController _addressController = TextEditingController();

  void placeAutoComplete(String query) async {
    Uri uri =
        Uri.https('maps.googleapis.com', 'maps/api/place/autocomplete/json', {
      'input': query,
      'key': AppStrings.mapAPIKey,
    });
    String? response = await NetworkUtility.fetchUrl(uri);
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
          'Chọn địa chỉ',
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
                decoration: const InputDecoration(
                    hintText: 'Tìm địa chỉ',
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Icon(Icons.location_on_outlined),
                    )),
              ),
            ),
          ),
          if (_addressController.text.isEmpty) ...[
            const Divider(
              height: 4,
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: ElevatedButton.icon(
                onPressed: () {
                  // placeAutoComplete('Dubai');
                },
                icon: const Icon(Icons.location_disabled_outlined),
                label: const Text('Sử dụng vị trí hiện tại của tôi'),
              ),
            ),
            const Divider(
              height: 4,
              thickness: 2,
            ),
          ],
          Expanded(
            child: ListView.builder(
                itemCount: placePredictions.length,
                itemBuilder: ((context, index) => LocationListTile(
                      press: () {},
                      location: placePredictions[index].description!,
                    ))),
          ),
        ],
      ),
    );
  }
}
