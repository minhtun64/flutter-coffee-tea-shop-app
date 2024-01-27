// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../models/store_model.dart';
import '../../values/app_strings.dart';

class LocationHelper {
  static Future<Position> getMyLocation() async {
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

    Position? currentUserPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return currentUserPosition;
  }

  static Future<Map<String, double>> getLatLngFromAddress(
      String address) async {
    try {
      final locations = await locationFromAddress(address);

      var latitude = 0.0;
      var longitude = 0.0;

      if (locations.isNotEmpty) {
        latitude = locations[0].latitude;
        longitude = locations[0].longitude;
      }

      return {'latitude': latitude, 'longitude': longitude};
    } catch (e) {
      print("Error getting coordinates: $e");
      return {'latitude': 0.0, 'longitude': 0.0};
    }
  }

  static Future<List<StoreItem>> getStoreListWithDistance(
      double lat, double lng) async {
    List<StoreItem> items = storeItems;
    for (int i = 0; i < items.length; i++) {
      double storelat = items[i].lat;

      double storelng = items[i].lng;

      var distanceImMeter = Geolocator.distanceBetween(
        lat,
        lng,
        storelat,
        storelng,
      );
      var distance = distanceImMeter.round().toInt();

      items[i].distance = (distance / 1000);
    }
    return items;
  }

  static List<StoreItem> sortByDistanceAscending(List<StoreItem> items) {
    items.sort((a, b) => a.distance.compareTo(b.distance));
    return items;
  }

  static List<StoreItem> sortByDistanceDescending(List<StoreItem> items) {
    items.sort((a, b) => b.distance.compareTo(a.distance));
    return items;
  }

  static List<StoreItem> filterStoresWithinDeliveryRange(
      List<StoreItem> stores) {
    return stores
        .where((store) => store.distance <= 15.0 && store.distance >= 0)
        .toList();
  }

  static Future<List<StoreItem>> getStoreListWithDistanceUpdate(
      double lat, double lng) async {
    List<StoreItem> items = storeItems;
    for (int i = 0; i < items.length; i++) {
      double storelat = items[i].lat;

      double storelng = items[i].lng;

      List<LatLng> polylineCoordinates = [];
      PolylinePoints polylinePoints = PolylinePoints();

      try {
        PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
          AppStrings.mapAPIKey,
          PointLatLng(lat, lng),
          PointLatLng(storelat, storelng),
          travelMode: TravelMode.driving,
        );

        if (result.points.isNotEmpty) {
          for (var point in result.points) {
            polylineCoordinates.add(LatLng(point.latitude, point.longitude));
          }
        } else {
          print(result.errorMessage);
        }
      } catch (e) {
        // Xử lý lỗi khi gọi API để lấy đường đi
        print("Đã xảy ra lỗi khi lấy đường đi: $e");
      }

      double totalDistance = 0;
      if (polylineCoordinates.isNotEmpty) {
        for (var i = 0; i < polylineCoordinates.length - 1; i++) {
          totalDistance += calculateDistance(
              polylineCoordinates[i].latitude,
              polylineCoordinates[i].longitude,
              polylineCoordinates[i + 1].latitude,
              polylineCoordinates[i + 1].longitude);
        }
      } else {
        totalDistance = 1000000000;
      }
      items[i].distance = totalDistance;
    }
    return items;
  }

  static double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  static Future<Map<String, double>?> getAddressCoordinates(
      String address) async {
    try {
      Uri uri = Uri.https('maps.googleapis.com', 'maps/api/geocode/json', {
        'place_id': address,
        'key': AppStrings.mapAPIKey,
      });
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data['status'] == 'OK') {
          final double latitude =
              data['results'][0]['geometry']['location']['lat'];
          final double longitude =
              data['results'][0]['geometry']['location']['lng'];

          // Trả về giá trị là một Map<String, double>
          return {'latitude': latitude, 'longitude': longitude};
        } else {
          print('Không tìm thấy toạ độ cho địa chỉ: $address');
        }
      } else {
        print('Đã xảy ra lỗi khi gửi yêu cầu: ${response.statusCode}');
      }
    } catch (e) {
      print('Đã xảy ra lỗi khi lấy toạ độ: $e');
    }
    // Nếu có lỗi, trả về null hoặc một giá trị mặc định khác
    return null;
  }
}
