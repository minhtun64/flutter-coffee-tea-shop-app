import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

import '../../values/app_colors.dart';
import '../delivery_store/delivery_store_screen.dart';

class DeliveryAddressPage extends StatefulWidget {
  const DeliveryAddressPage({Key? key}) : super(key: key);

  @override
  _DeliveryAddressPageState createState() => _DeliveryAddressPageState();
}

class _DeliveryAddressPageState extends State<DeliveryAddressPage> {
  final TextEditingController _addressController = TextEditingController();
  double deliveryLat = 0.0;
  double deliveryLng = 0.0;

  bool isDefaultAddress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text(
              'Giao hàng đến đâu nhỉ?',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: _buildDeliveryStep(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              const Text('Địa chỉ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(height: 4),
              TextField(
                controller: _addressController,
                onEditingComplete: () {
                  locationFromAddress(_addressController.text)
                      .then((locations) {
                    var latitude = 0.0;
                    var longitude = 0.0;
                    if (locations.isNotEmpty) {
                      latitude = locations[0].latitude;
                      longitude = locations[0].longitude;
                    }
                    print(latitude);
                    print(longitude);

                    setState(() {
                      deliveryLat = latitude;
                      deliveryLng = longitude;
                    });
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Tên đường, phường/xã, quận/huyện, tỉnh thành',
                  hintStyle: const TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.grey),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _addressController.clear();
                    },
                    icon: const Icon(Icons.clear, size: 16),
                  ),
                  prefixIcon: const Icon(Icons.location_on),
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              _buildTextField(
                  'Tên địa chỉ', 'Nhà/ Cơ quan/ Trường học/ ...', Icons.home),
              const SizedBox(height: 16),
              _buildTextField(
                  'Ghi chú khác', 'Số nhà/ Toà nhà/ ...', Icons.edit),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: isDefaultAddress,
                        onChanged: (value) {
                          setState(() {
                            isDefaultAddress = value!;
                          });
                        },
                      ),
                      const Text('Đặt làm địa chỉ mặc định'),
                    ],
                  ),
                ],
              ),
            ],
          ),
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DeliveryStorePage(
                    deliveryLat: deliveryLat, deliveryLng: deliveryLng)),
          );
        },
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
          color: Colors.grey,
        ),
        _buildStep(2, 'Cửa hàng giao hàng', false),
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

  Widget _buildTextField(String title, String label, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            )),
        const SizedBox(height: 4),
        TextField(
          decoration: InputDecoration(
            hintText: label,
            hintStyle: const TextStyle(
                fontWeight: FontWeight.normal, color: Colors.grey),
            suffixIcon: IconButton(
              onPressed: () {
                // Xử lý khi nhấn icon x
              },
              icon: const Icon(Icons.clear, size: 16),
            ),
            prefixIcon: Icon(icon),
            border: const OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
