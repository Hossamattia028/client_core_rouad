import 'package:background_locator/background_locator.dart';
import 'package:background_locator/settings/android_settings.dart';
import 'package:background_locator/settings/ios_settings.dart';
import 'package:background_locator/settings/locator_settings.dart';
import 'package:client_core/core/util/location/location_callback_handler.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void onStartTrack() async {
  if (await _checkLocationPermission()) {
    _startLocator();
    await BackgroundLocator.isServiceRunning();
  } else {
    // show error
  }
}

void onStopTrack()async{
  try{
    await BackgroundLocator.unRegisterLocationUpdate();
  }catch(e){
    debugPrint("onStopTrack $e");
  }
}

Future<bool> _checkLocationPermission() async {
  return await Permission.location.isGranted;
}

void _startLocator() {
  Map<String, dynamic> data = {'countInit': 1};
  BackgroundLocator.registerLocationUpdate(
      LocationCallbackHandler.callback,
      initCallback: LocationCallbackHandler.initCallback,
      initDataCallback: data,
      disposeCallback: LocationCallbackHandler.disposeCallback,
      iosSettings: const IOSSettings(
          accuracy: LocationAccuracy.NAVIGATION, distanceFilter: 1),
      autoStop: false,
      androidSettings: const AndroidSettings(
          accuracy: LocationAccuracy.NAVIGATION,
          interval: 10,
          distanceFilter: 0,
          client: LocationClient.google,
          androidNotificationSettings:  AndroidNotificationSettings(
              notificationChannelName: 'Location tracking',
              notificationTitle: '',
              notificationMsg: '',
              notificationBigMsg: 'Start order location Tracking - تتبع الموقع لتحديث موقع الطلب',
              notificationIconColor: Colors.grey,
              notificationIcon: 'ic_launcher',
              notificationTapCallback:
              LocationCallbackHandler.notificationCallback)));
}