import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

import '../../values/app_colors.dart';
import '../choose_address/choose_address_screen.dart';
import '../delivery_store/delivery_store_screen.dart';
import 'widgets/delivery_address_step.dart';

class DeliveryAddressPage extends StatefulWidget {
  const DeliveryAddressPage({Key? key, required this.location})
      : super(key: key);

  final String location;

  @override
  _DeliveryAddressPageState createState() => _DeliveryAddressPageState();
}

class _DeliveryAddressPageState extends State<DeliveryAddressPage> {
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  double deliveryLat = 0.0;
  double deliveryLng = 0.0;

  bool isDefaultAddress = false;
  bool isContinueEnabled = true;

  @override
  void initState() {
    _addressController.text = widget.location;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Column(
          children: [
            Text(
              'Giao hàng đến đâu nhỉ?',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: DeliverAddressStep(),
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChooseAddressPage()),
                  );
                },
                child: TextField(
                  enabled: false,
                  controller: _addressController,
                  // autofocus: true,
                  onEditingComplete: () {
                    locationFromAddress(_addressController.text)
                        .then((locations) {
                      var latitude = 0.0;
                      var longitude = 0.0;
                      if (locations.isNotEmpty) {
                        latitude = locations[0].latitude;
                        longitude = locations[0].longitude;
                      }
                      setState(() {
                        deliveryLat = latitude;
                        deliveryLng = longitude;
                      });
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      isContinueEnabled = _addressController.text.isNotEmpty;
                    });
                  },
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Tên đường, phường/xã, quận/huyện, tỉnh thành',
                    hintStyle: const TextStyle(
                        fontWeight: FontWeight.normal, color: Colors.grey),
                    // suffixIcon: IconButton(
                    //   onPressed: () {
                    //     _addressController.clear();
                    //   },
                    //   icon: const Icon(Icons.clear, size: 16),
                    // ),
                    prefixIcon: const Icon(Icons.location_on),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                          color: AppColors.primaryColor,
                          width: 0.0,
                          strokeAlign: 2),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _buildTextField('Tên địa chỉ', 'Nhà/ Cơ quan/ Trường học/ ...',
                  _nameController, Icons.home),
              const SizedBox(height: 16),
              _buildTextField('Ghi chú khác', 'Số nhà/ Toà nhà/ ...',
                  _noteController, Icons.edit),
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
          backgroundColor: isContinueEnabled
              ? MaterialStateProperty.all(AppColors.primaryColor)
              : MaterialStateProperty.all(Colors.grey[300]),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        onPressed: isContinueEnabled
            ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeliveryStorePage(
                      deliveryLat: deliveryLat,
                      deliveryLng: deliveryLng,
                      // address: _addressController.text,
                      // name: _nameController.text,
                      // note: _noteController.text,
                    ),
                  ),
                );
              }
            : null, // Nếu nút Tiếp tục không được kích hoạt, đặt giá trị onPressed là null
        child: Text(
          'Tiếp tục',
          style: TextStyle(
            color: isContinueEnabled ? Colors.white : Colors.grey[600],
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String title, String label,
      TextEditingController controller, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            )),
        const SizedBox(height: 4),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: label,
            hintStyle: const TextStyle(
                fontWeight: FontWeight.normal, color: Colors.grey),
            suffixIcon: IconButton(
              onPressed: () {
                controller.clear();
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
