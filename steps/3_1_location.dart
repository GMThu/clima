import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  String locationMessage = "尚未取得位置";

  void getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // 1. 確認定位服務是否開啟
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      locationMessage = "⚠️ 定位服務未開啟";
    }

    // 2. 確認並請求權限
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        locationMessage = "❌ 使用者拒絕授權位置權限";
      }
    }

    if (permission == LocationPermission.deniedForever) {
      locationMessage = "❌ 永久拒絕位置權限，請至設定開啟";
    }

    // 設定位置
    final LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    try {
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      );

      latitude = position.latitude;
      longitude = position.longitude;
      print(position);
    } catch (e) {
      print(e);
    }
  }
}
