import 'product_image_model.dart';
import 'product_price_model.dart';

class ProductItem {
  final String id;
  final String name;
  final String descr;

  final List<ProductImage> images;
  final List<ProductPrice> prices;
  final String type;

  String oriPrice;

  ProductItem({
    required this.id,
    required this.name,
    required this.descr,
    required this.images,
    required this.prices,
    required this.type,
    this.oriPrice = '',
  });
}

final List<ProductItem> productItems = [
  ProductItem(
    id: '1',
    name: 'Đường Đen Sữa Đá',
    descr:
        'Nếu chuộng vị cà phê đậm đà, bùng nổ và thích vị đường đen ngọt thơm, Đường Đen Sữa Đá đích thị là thức uống dành cho bạn. Không chỉ giúp bạn tỉnh táo buổi sáng, Đường Đen Sữa Đá còn hấp dẫn đến ngụm cuối cùng bởi thạch cà phê giòn dai, nhai cực cuốn. - Khuấy đều trước khi sử dụng',
    prices: [
      ProductPrice(size: 'S', price: '35000'),
      ProductPrice(size: 'M', price: '45000'),
      ProductPrice(size: 'L', price: '55000'),
    ],
    images: [
      ProductImage(
          path: 'assets/images/products/coffee/coffee_1_1.jpeg', isMain: true),
      ProductImage(path: 'assets/images/products/coffee/coffee_2_1.jpeg'),
    ],
    type: 'coffee',
  ),
  ProductItem(
    id: '2',
    name: 'Cà Phê Sữa Đá',
    descr:
        'Cà phê Đắk Lắk nguyên chất được pha phin truyền thống kết hợp với sữa đặc tạo nên hương vị đậm đà, hài hòa giữa vị ngọt đầu lưỡi và vị đắng thanh thoát nơi hậu vị.',
    prices: [
      ProductPrice(size: 'S', price: '19000'),
      ProductPrice(size: 'M', price: '29000'),
      ProductPrice(size: 'L', price: '39000'),
    ],
    images: [
      ProductImage(
          path: 'assets/images/products/coffee/coffee_2_1.jpeg', isMain: true),
      ProductImage(path: 'assets/images/products/coffee/coffee_3_1.jpeg'),
    ],
    type: 'coffee',
  ),
  ProductItem(
    id: '3',
    name: 'Bạc Sỉu',
    descr:
        'Bạc sỉu chính là "Ly sữa trắng kèm một chút cà phê". Thức uống này rất phù hợp những ai vừa muốn trải nghiệm chút vị đắng của cà phê vừa muốn thưởng thức vị ngọt béo ngậy từ sữa.',
    prices: [
      ProductPrice(size: 'S', price: '12000'),
      ProductPrice(size: 'M', price: '22000'),
      ProductPrice(size: 'L', price: '32000'),
    ],
    images: [
      ProductImage(
          path: 'assets/images/products/coffee/coffee_3_1.jpeg', isMain: true),
      ProductImage(path: 'assets/images/products/coffee/coffee_4_1.jpeg'),
    ],
    type: 'coffee',
    oriPrice: '29000',
  ),
  ProductItem(
    id: '4',
    name: 'Caramel Macchiato Đá',
    descr:
        'Khuấy đều trước khi sử dụng Caramel Macchiato sẽ mang đến một sự ngạc nhiên thú vị khi vị thơm béo của bọt sữa, sữa tươi, vị đắng thanh thoát của cà phê Espresso hảo hạng và vị ngọt đậm của sốt caramel được gói gọn trong một tách cà phê.',
    prices: [
      ProductPrice(size: 'S', price: '38000'),
      ProductPrice(size: 'M', price: '48000'),
      ProductPrice(size: 'L', price: '58000'),
    ],
    images: [
      ProductImage(
          path: 'assets/images/products/coffee/coffee_4_1.jpeg', isMain: true),
      ProductImage(path: 'assets/images/products/coffee/coffee_5_1.jpeg'),
    ],
    type: 'coffee',
    oriPrice: '55000',
  ),
  ProductItem(
    id: '5',
    name: 'Latte Nóng',
    descr:
        'Một sự kết hợp tinh tế giữa vị đắng cà phê Espresso nguyên chất hòa quyện cùng vị sữa nóng ngọt ngào, bên trên là một lớp kem mỏng nhẹ tạo nên một tách cà phê hoàn hảo về hương vị lẫn nhãn quan.',
    prices: [
      ProductPrice(size: 'S', price: '45000'),
      ProductPrice(size: 'M', price: '55000'),
      ProductPrice(size: 'L', price: '65000'),
    ],
    images: [
      ProductImage(
          path: 'assets/images/products/coffee/coffee_5_1.jpeg', isMain: true),
      ProductImage(path: 'assets/images/products/coffee/coffee_1_1.jpeg'),
    ],
    type: 'coffee',
  ),
  ProductItem(
    id: '5',
    name: 'Latte Nóng',
    descr:
        'Một sự kết hợp tinh tế giữa vị đắng cà phê Espresso nguyên chất hòa quyện cùng vị sữa nóng ngọt ngào, bên trên là một lớp kem mỏng nhẹ tạo nên một tách cà phê hoàn hảo về hương vị lẫn nhãn quan.',
    prices: [
      ProductPrice(size: 'S', price: '45000'),
      ProductPrice(size: 'M', price: '55000'),
      ProductPrice(size: 'L', price: '65000'),
    ],
    images: [
      ProductImage(
          path: 'assets/images/products/coffee/coffee_5_1.jpeg', isMain: true),
      ProductImage(path: 'assets/images/products/coffee/coffee_1_1.jpeg'),
    ],
    type: 'coffee',
  ),
  ProductItem(
    id: '5',
    name: 'Latte Nóng',
    descr:
        'Một sự kết hợp tinh tế giữa vị đắng cà phê Espresso nguyên chất hòa quyện cùng vị sữa nóng ngọt ngào, bên trên là một lớp kem mỏng nhẹ tạo nên một tách cà phê hoàn hảo về hương vị lẫn nhãn quan.',
    prices: [
      ProductPrice(size: 'S', price: '45000'),
      ProductPrice(size: 'M', price: '55000'),
      ProductPrice(size: 'L', price: '65000'),
    ],
    images: [
      ProductImage(
          path: 'assets/images/products/coffee/coffee_5_1.jpeg', isMain: true),
      ProductImage(path: 'assets/images/products/coffee/coffee_1_1.jpeg'),
    ],
    type: 'coffee',
  ),
  ProductItem(
    id: '5',
    name: 'Latte Nóng',
    descr:
        'Một sự kết hợp tinh tế giữa vị đắng cà phê Espresso nguyên chất hòa quyện cùng vị sữa nóng ngọt ngào, bên trên là một lớp kem mỏng nhẹ tạo nên một tách cà phê hoàn hảo về hương vị lẫn nhãn quan.',
    prices: [
      ProductPrice(size: 'S', price: '45000'),
      ProductPrice(size: 'M', price: '55000'),
      ProductPrice(size: 'L', price: '65000'),
    ],
    images: [
      ProductImage(
          path: 'assets/images/products/coffee/coffee_5_1.jpeg', isMain: true),
      ProductImage(path: 'assets/images/products/coffee/coffee_1_1.jpeg'),
    ],
    type: 'coffee',
  ),
  ProductItem(
    id: '5',
    name: 'Latte Nóng',
    descr:
        'Một sự kết hợp tinh tế giữa vị đắng cà phê Espresso nguyên chất hòa quyện cùng vị sữa nóng ngọt ngào, bên trên là một lớp kem mỏng nhẹ tạo nên một tách cà phê hoàn hảo về hương vị lẫn nhãn quan.',
    prices: [
      ProductPrice(size: 'S', price: '45000'),
      ProductPrice(size: 'M', price: '55000'),
      ProductPrice(size: 'L', price: '65000'),
    ],
    images: [
      ProductImage(
          path: 'assets/images/products/coffee/coffee_5_1.jpeg', isMain: true),
      ProductImage(path: 'assets/images/products/coffee/coffee_1_1.jpeg'),
    ],
    type: 'coffee',
    oriPrice: '55000',
  ),
  ProductItem(
    id: '5',
    name: 'Latte Nóng',
    descr:
        'Một sự kết hợp tinh tế giữa vị đắng cà phê Espresso nguyên chất hòa quyện cùng vị sữa nóng ngọt ngào, bên trên là một lớp kem mỏng nhẹ tạo nên một tách cà phê hoàn hảo về hương vị lẫn nhãn quan.',
    prices: [
      ProductPrice(size: 'S', price: '45000'),
      ProductPrice(size: 'M', price: '55000'),
      ProductPrice(size: 'L', price: '65000'),
    ],
    images: [
      ProductImage(
          path: 'assets/images/products/coffee/coffee_5_1.jpeg', isMain: true),
      ProductImage(path: 'assets/images/products/coffee/coffee_1_1.jpeg'),
    ],
    type: 'coffee',
  ),
  ProductItem(
    id: '5',
    name: 'Latte Nóng',
    descr:
        'Một sự kết hợp tinh tế giữa vị đắng cà phê Espresso nguyên chất hòa quyện cùng vị sữa nóng ngọt ngào, bên trên là một lớp kem mỏng nhẹ tạo nên một tách cà phê hoàn hảo về hương vị lẫn nhãn quan.',
    prices: [
      ProductPrice(size: 'S', price: '45000'),
      ProductPrice(size: 'M', price: '55000'),
      ProductPrice(size: 'L', price: '65000'),
    ],
    images: [
      ProductImage(
          path: 'assets/images/products/coffee/coffee_5_1.jpeg', isMain: true),
      ProductImage(path: 'assets/images/products/coffee/coffee_1_1.jpeg'),
    ],
    type: 'coffee',
  ),
  ProductItem(
    id: '5',
    name: 'Latte Nóng',
    descr:
        'Một sự kết hợp tinh tế giữa vị đắng cà phê Espresso nguyên chất hòa quyện cùng vị sữa nóng ngọt ngào, bên trên là một lớp kem mỏng nhẹ tạo nên một tách cà phê hoàn hảo về hương vị lẫn nhãn quan.',
    prices: [
      ProductPrice(size: 'S', price: '45000'),
      ProductPrice(size: 'M', price: '55000'),
      ProductPrice(size: 'L', price: '65000'),
    ],
    images: [
      ProductImage(
          path: 'assets/images/products/coffee/coffee_5_1.jpeg', isMain: true),
      ProductImage(path: 'assets/images/products/coffee/coffee_1_1.jpeg'),
    ],
    type: 'coffee',
  ),
  ProductItem(
    id: '5',
    name: 'Latte Nóng',
    descr:
        'Một sự kết hợp tinh tế giữa vị đắng cà phê Espresso nguyên chất hòa quyện cùng vị sữa nóng ngọt ngào, bên trên là một lớp kem mỏng nhẹ tạo nên một tách cà phê hoàn hảo về hương vị lẫn nhãn quan.',
    prices: [
      ProductPrice(size: 'S', price: '45000'),
      ProductPrice(size: 'M', price: '55000'),
      ProductPrice(size: 'L', price: '65000'),
    ],
    images: [
      ProductImage(
          path: 'assets/images/products/coffee/coffee_5_1.jpeg', isMain: true),
      ProductImage(path: 'assets/images/products/coffee/coffee_1_1.jpeg'),
    ],
    type: 'coffee',
  ),
  ProductItem(
    id: '5',
    name: 'Latte Nóng',
    descr:
        'Một sự kết hợp tinh tế giữa vị đắng cà phê Espresso nguyên chất hòa quyện cùng vị sữa nóng ngọt ngào, bên trên là một lớp kem mỏng nhẹ tạo nên một tách cà phê hoàn hảo về hương vị lẫn nhãn quan.',
    prices: [
      ProductPrice(size: 'S', price: '45000'),
      ProductPrice(size: 'M', price: '55000'),
      ProductPrice(size: 'L', price: '65000'),
    ],
    images: [
      ProductImage(
          path: 'assets/images/products/coffee/coffee_5_1.jpeg', isMain: true),
      ProductImage(path: 'assets/images/products/coffee/coffee_1_1.jpeg'),
    ],
    type: 'coffee',
  ),
  ProductItem(
    id: '5',
    name: 'Latte Nóng',
    descr:
        'Một sự kết hợp tinh tế giữa vị đắng cà phê Espresso nguyên chất hòa quyện cùng vị sữa nóng ngọt ngào, bên trên là một lớp kem mỏng nhẹ tạo nên một tách cà phê hoàn hảo về hương vị lẫn nhãn quan.',
    prices: [
      ProductPrice(size: 'S', price: '45000'),
      ProductPrice(size: 'M', price: '55000'),
      ProductPrice(size: 'L', price: '65000'),
    ],
    images: [
      ProductImage(
          path: 'assets/images/products/coffee/coffee_5_1.jpeg', isMain: true),
      ProductImage(path: 'assets/images/products/coffee/coffee_1_1.jpeg'),
    ],
    type: 'coffee',
  ),
  ProductItem(
    id: '5',
    name: 'Latte Nóng',
    descr:
        'Một sự kết hợp tinh tế giữa vị đắng cà phê Espresso nguyên chất hòa quyện cùng vị sữa nóng ngọt ngào, bên trên là một lớp kem mỏng nhẹ tạo nên một tách cà phê hoàn hảo về hương vị lẫn nhãn quan.',
    prices: [
      ProductPrice(size: 'S', price: '45000'),
      ProductPrice(size: 'M', price: '55000'),
      ProductPrice(size: 'L', price: '65000'),
    ],
    images: [
      ProductImage(
          path: 'assets/images/products/coffee/coffee_5_1.jpeg', isMain: true),
      ProductImage(path: 'assets/images/products/coffee/coffee_1_1.jpeg'),
    ],
    type: 'coffee',
  ),
  ProductItem(
    id: '5',
    name: 'Latte Nóng',
    descr:
        'Một sự kết hợp tinh tế giữa vị đắng cà phê Espresso nguyên chất hòa quyện cùng vị sữa nóng ngọt ngào, bên trên là một lớp kem mỏng nhẹ tạo nên một tách cà phê hoàn hảo về hương vị lẫn nhãn quan.',
    prices: [
      ProductPrice(size: 'S', price: '45000'),
      ProductPrice(size: 'M', price: '55000'),
      ProductPrice(size: 'L', price: '65000'),
    ],
    images: [
      ProductImage(
          path: 'assets/images/products/coffee/coffee_5_1.jpeg', isMain: true),
      ProductImage(path: 'assets/images/products/coffee/coffee_1_1.jpeg'),
    ],
    type: 'coffee',
  ),
  ProductItem(
    id: '5',
    name: 'Latte Nóng',
    descr:
        'Một sự kết hợp tinh tế giữa vị đắng cà phê Espresso nguyên chất hòa quyện cùng vị sữa nóng ngọt ngào, bên trên là một lớp kem mỏng nhẹ tạo nên một tách cà phê hoàn hảo về hương vị lẫn nhãn quan.',
    prices: [
      ProductPrice(size: 'S', price: '45000'),
      ProductPrice(size: 'M', price: '55000'),
      ProductPrice(size: 'L', price: '65000'),
    ],
    images: [
      ProductImage(
          path: 'assets/images/products/coffee/coffee_5_1.jpeg', isMain: true),
      ProductImage(path: 'assets/images/products/coffee/coffee_1_1.jpeg'),
    ],
    type: 'coffee',
  ),
  ProductItem(
    id: '6',
    name: 'Trà Đào Cam Sả Nóng',
    descr:
        'Vị thanh ngọt của đào, vị chua dịu của Cam Vàng nguyên vỏ, vị chát của trà đen tươi được ủ mới mỗi 4 tiếng, cùng hương thơm nồng đặc trưng của sả chính là điểm sáng làm nên sức hấp dẫn của thức uống này.',
    prices: [
      ProductPrice(size: 'S', price: '49000'),
      ProductPrice(size: 'M', price: '59000'),
      ProductPrice(size: 'L', price: '69000'),
    ],
    images: [
      ProductImage(
          path: 'assets/images/products/tea/tea_1_1.jpeg', isMain: true),
    ],
    type: 'tea',
  ),
];
