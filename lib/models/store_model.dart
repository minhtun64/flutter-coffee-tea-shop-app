class StoreItem {
  final String id;
  final String name;
  final String image;
  final double lat;
  final double lng;
  double distance;

  StoreItem({
    required this.id,
    required this.name,
    required this.image,
    required this.lat,
    required this.lng,
    this.distance = 0,
  });

  Map toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'lat': lat,
      'lng': lng,
    };
  }
}

final List<StoreItem> storeItems = [
  StoreItem(
    id: '1',
    name: 'Brili Coffee Lê Văn Việt',
    image: 'assets/images/stores/store_1.jpeg',
    lat: 37.7860604,
    lng: -122.4082781,
  ),
  StoreItem(
    id: '2',
    name: 'Brili Coffee Nhà văn hoá sinh viên',
    image: 'assets/images/stores/store_2.jpeg',
    lat: 37.7862546,
    lng: -122.4139419,
  ),
  StoreItem(
    id: '3',
    name: 'Brili Coffee Thủ Đức',
    image: 'assets/images/stores/store_3.jpeg',
    lat: 37.7814644,
    lng: -122.4052868,
  ),
  StoreItem(
    id: '4',
    name: 'Brili Coffee Landmark 81',
    image: 'assets/images/stores/store_4.jpeg',
    lat: 37.7864032,
    lng: -122.3983216,
  ),
  StoreItem(
    id: '5',
    name: 'Brili Coffee Gigamall',
    image: 'assets/images/stores/store_5.jpeg',
    lat: 37.7886872,
    lng: -122.4038625,
  ),
];
