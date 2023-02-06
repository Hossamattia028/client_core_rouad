import 'dart:async';
import 'dart:convert';
import 'dart:isolate';
import 'dart:math';
import 'dart:ui';
import 'package:background_locator/location_dto.dart';
import 'package:client_core/core/strings/api/api_url.dart';
import 'package:client_core/core/util/hive_boxes.dart';
import 'package:client_core/core/util/location/file_manager.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;



class LocationServiceRepository {
  static final LocationServiceRepository _instance = LocationServiceRepository._();

  LocationServiceRepository._();

  factory LocationServiceRepository() {
    return _instance;
  }

  static const String isolateName = 'LocatorIsolate';

  int _count = -1;

  Future<void> init(Map<dynamic, dynamic> params) async {
    //TODO change logs
    debugPrint("***********Init callback handler");
    if (params.containsKey('countInit')) {
      dynamic tmpCount = params['countInit'];
      if (tmpCount is double) {
        _count = tmpCount.toInt();
      } else if (tmpCount is String) {
        _count = int.parse(tmpCount);
      } else if (tmpCount is int) {
        _count = tmpCount;
      } else {
        _count = -2;
      }
    } else {
      _count = 0;
    }
    debugPrint("$_count");
    await setLogLabel("start");
    final SendPort? send = IsolateNameServer.lookupPortByName(isolateName);
    send?.send(null);
  }

  Future<void> dispose() async {
    debugPrint("***********Dispose callback handler");
    debugPrint("$_count");
    await setLogLabel("end");
    final SendPort? send = IsolateNameServer.lookupPortByName(isolateName);
    send?.send(null);
  }

  Future<void> callback(LocationDto locationDto) async {
    debugPrint('$_count location in dart: ${locationDto.toString()}');
    await setLogPosition(_count, locationDto);
    var body = {
      'latitude': locationDto.latitude.toString(),
      'longitude':  locationDto.longitude.toString(),
    };
    if(Hive.isBoxOpen("userId") && HiveBoxes.getUserId()!=null){
      var response = await http.post(Uri.parse("${ApiUrl.UPDATE_USER_PROFILE}${HiveBoxes.getUserId()}"),
          body: json.encode(body),
          headers: ApiUrl.headerAuth);
      debugPrint("updateUserProfile: ${response.body}");
      final SendPort? send = IsolateNameServer.lookupPortByName(isolateName);
      send?.send(locationDto);
      _count++;
    }


  }

  static Future<void> setLogLabel(String label) async {
    final date = DateTime.now();
    await FileManager.writeToLogFile(
        '------------\n$label: ${formatDateLog(date)}\n------------\n');
  }

  static Future<void> setLogPosition(int count, LocationDto data) async {
    final date = DateTime.now();
    await FileManager.writeToLogFile(
        '$count : ${formatDateLog(date)} --> ${formatLog(data)} --- isMocked: ${data.isMocked}\n');
  }

  static double dp(double val, int places) {
    num mod = pow(10.0, places);
    return ((val * mod).round().toDouble() / mod);
  }

  static String formatDateLog(DateTime date) {
    return "${date.hour}:${date.minute}:${date.second}";
  }

  static String formatLog(LocationDto locationDto) {
    return "${dp(locationDto.latitude, 4)} ${dp(locationDto.longitude, 4)}";
  }
}
