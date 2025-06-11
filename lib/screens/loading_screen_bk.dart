import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String locationMessage = "尚未取得位置";

  @override
  void getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // 1. 確認定位服務是否開啟
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        locationMessage = "⚠️ 定位服務未開啟";
      });
      return;
    }

    // 2. 確認並請求權限
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          locationMessage = "❌ 使用者拒絕授權位置權限";
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        locationMessage = "❌ 永久拒絕位置權限，請至設定開啟";
      });
      return;
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
      print(position);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Get the current location
            getLocation();
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            textStyle: TextStyle(fontSize: 16.0),
          ),
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
