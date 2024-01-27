import 'package:flutter/material.dart';

import '../../utils/helpers/location_helper.dart';
import '../../values/app_colors.dart';
import '../delivery_store/delivery_store_screen.dart';
import '../../utils/common_widgets/custom_button.dart';
import 'widgets/delivery_address_step.dart';

class DeliveryAddressPage extends StatefulWidget {
  const DeliveryAddressPage(
      {Key? key,
      this.placeId,
      required this.address,
      this.deliveryMyLat,
      this.deliveryMyLng})
      : super(key: key);

  final String? placeId;
  final String address;
  final double? deliveryMyLat;
  final double? deliveryMyLng;

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

  void getCoordinatesFromAddress() async {
    // Map<String, double> coordinates =
    //     await LocationHelper.getLatLngFromAddress(widget.location);
    final coordinates =
        await LocationHelper.getAddressCoordinates(widget.placeId!);
    if (coordinates != null) {
      print(coordinates['latitude']!);
      print(coordinates['longitude']!);
      setState(() {
        deliveryLat = coordinates['latitude']!;
        deliveryLng = coordinates['longitude']!;
      });
    }
  }

  @override
  void initState() {
    _addressController.text = widget.address;
    if (widget.deliveryMyLat != null && widget.deliveryMyLng != null) {
      setState(() {
        deliveryLat = widget.deliveryMyLat!;
        deliveryLng = widget.deliveryMyLng!;
      });
    } else {
      // Nếu không có giá trị, thực hiện lấy toạ độ từ địa chỉ
      getCoordinatesFromAddress();
    }
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
                  Navigator.of(context).pop();
                },
                child: TextField(
                  enabled: false,
                  controller: _addressController,
                  maxLines: 1,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.location_on),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
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
      floatingActionButton: CustomButton(
        onPressed: () {
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
        },
        text: 'Tiếp tục',
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
