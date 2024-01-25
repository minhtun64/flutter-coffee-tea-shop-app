// Tạo một class helper
import 'package:intl/intl.dart';

import '../../models/product_image_model.dart';
import '../../models/product_item_model.dart';
import '../../models/product_price_model.dart';

class ProductHelper {
  static double getSizePrice(ProductItem product, String size) {
    return product.prices
        .firstWhere((price) => price.size == size,
            orElse: () => ProductPrice(size: '', price: 0.0))
        .price;
  }

  static String getMainImagePath(ProductItem product) {
    // Lặp qua danh sách ảnh để tìm ảnh isMain
    for (ProductImage image in product.images) {
      if (image.isMain) {
        return image.path;
      }
    }
    // Nếu không tìm thấy ảnh isMain, trả về ảnh đầu tiên trong danh sách
    return product.images.isNotEmpty ? product.images[0].path : '';
  }

  static List<String> getImagePaths(ProductItem product) {
    List<String> imagePaths = [];

    // Lấy danh sách các path của ảnh
    for (ProductImage image in product.images) {
      imagePaths.add(image.path);
    }

    // Kiểm tra xem có ảnh isMain không
    ProductImage mainImage = product.images.firstWhere(
      (image) => image.isMain,
      orElse: () =>
          ProductImage(path: ''), // Ảnh mặc định nếu không có ảnh isMain
    );

    // Nếu có ảnh isMain, đưa nó lên đầu danh sách
    if (mainImage.path.isNotEmpty) {
      imagePaths.remove(mainImage.path);
      imagePaths.insert(0, mainImage.path);
    }

    return imagePaths;
  }

  static String formatPrice(double price) {
    final priceFormat = NumberFormat.currency(locale: 'vi_VN', symbol: '');
    return '${priceFormat.format(price)}đ';
  }
}
