import 'package:flutter/material.dart';

import '../../../modals/items.dart';
import '../../../values/app_colors.dart';
import '../../../values/app_strings.dart';
import '../../../values/app_theme.dart';
import 'order_sort_option.dart';

class OrderSortFilterModal extends StatefulWidget {
  final List<ProductItem> productItems;
  final Function(List<ProductItem>) onFilterApplied;

  const OrderSortFilterModal({
    Key? key,
    required this.productItems,
    required this.onFilterApplied,
  }) : super(key: key);

  @override
  State<OrderSortFilterModal> createState() => _OrderSortFilterModalState();
}

class _OrderSortFilterModalState extends State<OrderSortFilterModal> {
  TextEditingController controller = TextEditingController();

  bool isSortExpanded = false;
  bool isPriceFilterExpanded = false;

  bool sortAZ = false;

  bool sortZA = false;

  bool sortLowToHigh = false;

  bool sortHighToLow = false;

  String selectedSortOption = '';

  double _minPrice = 0;
  double _maxPrice = 200000;

  final TextEditingController _minPriceController = TextEditingController();
  final TextEditingController _maxPriceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _minPriceController.text = _minPrice.round().toString();
    _maxPriceController.text = _maxPrice.round().toString();
  }

  // TextEditingController _minPriceController;
  // TextEditingController _maxPriceController;

  // @override
  // void initState() {
  //   super.initState();
  //   _minPriceController = TextEditingController(text: _minPrice.toString());
  //   _maxPriceController = TextEditingController(text: _maxPrice.toString());
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Container(
        color: AppColors.scaffoldBackgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        height: 600,
        // height: 200,
        // color: Colors.amber,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    title: const Text(AppStrings.sortBy,
                        style: AppTheme.body_Medium_Bold),
                    trailing: isSortExpanded
                        ? const Icon(Icons.arrow_drop_up)
                        : const Icon(Icons.arrow_drop_down),
                    onTap: () {
                      setState(() {
                        // Đảo ngược trạng thái mở rộng
                        isSortExpanded = !isSortExpanded;
                      });
                    },
                  ),
                  if (isSortExpanded) ...[
                    OrderSortOption(
                      title: 'Tên: A-Z',
                      option: 'sortAZ',
                      selectedOption: selectedSortOption,
                      // onChanged: (value) {
                      // setState(() {
                      //   sortAZ = value ?? sortAZ;
                      //   sortZA = false;
                      //   sortLowToHigh = false;
                      //   sortHighToLow = false;
                      //   selectedSortOption = value ?? selectedSortOption;
                      // });
                      // },
                      onChanged: (value) {
                        setState(() {
                          selectedSortOption = value ?? selectedSortOption;
                        });
                      },
                    ),
                    OrderSortOption(
                      title: 'Tên: Z-A',
                      option: 'sortZA',
                      selectedOption: selectedSortOption,
                      onChanged: (value) {
                        setState(() {
                          selectedSortOption = value ?? selectedSortOption;
                        });
                      },
                    ),
                    OrderSortOption(
                      title: 'Giá: Thấp nhất',
                      option: 'sortLowToHigh',
                      selectedOption: selectedSortOption,
                      onChanged: (value) {
                        setState(() {
                          selectedSortOption = value ?? selectedSortOption;
                        });
                      },
                    ),
                    OrderSortOption(
                      title: 'Giá: Cao nhất',
                      option: 'sortHighToLow',
                      selectedOption: selectedSortOption,
                      onChanged: (value) {
                        setState(() {
                          selectedSortOption = value ?? selectedSortOption;
                        });
                      },
                    ),
                  ],
                  const Divider(
                    color: Colors.grey,
                    thickness: 0.8,
                    height: 10,
                    indent: 16.0, // Adjust the space on the left side
                    endIndent: 16.0, // Adjust the space on the right side
                  ),
                  ListTile(
                    title: const Text(AppStrings.price,
                        style: AppTheme.body_Medium_Bold),
                    trailing: isPriceFilterExpanded
                        ? const Icon(Icons.arrow_drop_up)
                        : const Icon(Icons.arrow_drop_down),
                    onTap: () {
                      setState(() {
                        // Đảo ngược trạng thái mở rộng
                        isPriceFilterExpanded = !isPriceFilterExpanded;
                      });
                    },
                  ),
                  if (isPriceFilterExpanded) ...[
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight:
                            2.0, // Adjust the height of the slider track
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius:
                                8.0), // Adjust the size of the thumb
                        // overlayShape: const RoundSliderOverlayShape(
                        //     overlayRadius:
                        //         16.0), // Adjust the size of the overlay
                      ),
                      child: RangeSlider(
                        activeColor: Colors.black,
                        values: RangeValues(_minPrice, _maxPrice),
                        min: 0,
                        max: 200000,
                        onChanged: (RangeValues values) {
                          setState(() {
                            _minPrice = values.start;
                            _maxPrice = values.end;
                            _minPriceController.text =
                                _minPrice.round().toString();
                            _maxPriceController.text =
                                _maxPrice.round().toString();
                          });
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TextField(
                              textAlign: TextAlign.end,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      signed: true, decimal: true),
                              inputFormatters: const [],
                              decoration: const InputDecoration(
                                labelText: 'Từ',
                                suffixText: 'đ',
                                hintText: '0',
                              ),
                              controller: _minPriceController,
                              onEditingComplete: () {
                                double minValue =
                                    double.tryParse(_minPriceController.text) ??
                                        0;
                                minValue = minValue.clamp(0, _maxPrice);
                                setState(() {
                                  _minPrice = minValue;
                                });
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                            ),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            child: TextField(
                              textAlign: TextAlign.end,
                              decoration: const InputDecoration(
                                  labelText: 'Đến',
                                  suffixText: 'đ',
                                  hintText: '200000'),
                              controller: _maxPriceController,
                              onEditingComplete: () {
                                double maxValue =
                                    double.tryParse(_maxPriceController.text) ??
                                        200000;
                                maxValue = maxValue.clamp(_minPrice, 200000);
                                setState(() {
                                  _maxPrice = maxValue;
                                });
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  const SizedBox(
                    height: 300,
                  )
                ],
              ),
            ),
            // const Spacer(),
            Container(
              margin: const EdgeInsets.only(bottom: 32.0),
              width: MediaQuery.of(context).size.width * 0.9,
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    AppColors.primaryColor,
                  ),
                ),
                onPressed: () {
                  applyFilters();
                  // Navigator.of(context).pop(); // Đóng modal
                },
                child: const Text(AppStrings.apply,
                    style: AppTheme.body_Medium_Bold_White),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void applyFilters() {
    // Thực hiện lọc và sắp xếp sản phẩm dựa trên các điều kiện đã chọn
    List<ProductItem> filteredItems = widget.productItems;
//Lọc sắp xếp
    if (selectedSortOption == 'sortAZ') {
      filteredItems.sort((a, b) => a.name.compareTo(b.name));
    } else if (selectedSortOption == 'sortZA') {
      filteredItems.sort((a, b) => b.name.compareTo(a.name));
    } else if (selectedSortOption == 'sortLowToHigh') {
      filteredItems.sort(
          (a, b) => double.parse(a.price).compareTo(double.parse(b.price)));
    } else if (selectedSortOption == 'sortHighToLow') {
      filteredItems.sort(
          (a, b) => double.parse(b.price).compareTo(double.parse(a.price)));
    }
    // Lọc theo giá
    filteredItems = filteredItems.where((product) {
      if (product.price.isNotEmpty) {
        double productPrice = double.tryParse(product.price) ?? 0;
        return productPrice >= _minPrice && productPrice <= _maxPrice;
      }
      return false;
    }).toList();

    print(filteredItems.length);

    // Gửi kết quả lọc đến OrderProductTab thông qua callback
    widget.onFilterApplied(filteredItems);

    // Đóng modal
    Navigator.of(context).pop();
  }
}
