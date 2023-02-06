import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material;
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:huawei_map/map.dart' as huawei_map;
// import 'package:google_huawei_availability/google_huawei_availability.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

import 'hive_boxes.dart';


class Util {
  static sendWhatsApp(String phone,String message)async{
    if(Platform.isAndroid){
      // await FlutterOpenWhatsapp.sendSingleMessage(phone, " ").then((value) {
      //   }).onError((error, stackTrace) {
      //   Util.snackBar(msg: error.toString(), color: redColor);
      // });
    }else{
      // await shareWhatsapp.shareText("",phone: phone).onError((error, stackTrace) {
      //   Util.snackBar(msg: error.toString(), color: redColor);
      //   return false;
      // });
    }
    // launchH('https://wa.me/$phone');
    // launchH('https://api.whatsapp.com/send/?phone=$phone');
    // await Open.whatsApp(whatsAppNumber: phone, text: " ").onError((error, stackTrace) {
    //   print(error.toString());
    //   return false;
    // });
  }
  // static launchH(String url)async{
  //     if (Platform.isAndroid) {
  //       await canLaunchUrl(Uri.parse(url))==true?
  //       await launchUrl(Uri.parse(url)):debugPrint("error when sendWhatsApp");
  //     } else {
  //       await canLaunchUrl(Uri.parse(url))==true?
  //       await launchUrl(Uri.parse(url)):debugPrint("error when sendWhatsApp");
  //     }
  // }

  static bool checkUser(){
    return HiveBoxes.getUserToken() != null && HiveBoxes.getUserToken() !='' && HiveBoxes.getUserId()!=null;
  }

  static showFeedBackMessage(BuildContext context, String msg, Color color,
      {bool addBehaviour = true}) {

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: color,
        behavior: addBehaviour ? SnackBarBehavior.floating : null,
        action: SnackBarAction(
            label: 'Dismiss',
            textColor: Colors.white,
            onPressed: () => ScaffoldMessenger.of(context).clearSnackBars),
      ),
    );
  }


  /// signOut
  static void signOut(BuildContext ctx)async{
    HiveBoxes.setUserLng(userLng: "ar");
    // changeLocale(ctx,"ar");
    await HiveBoxes.removeDataForLogout();

  }



  static Future<bool> checkLocationPermission() async {
    try{
       await Permission.location.request();
       // await Permission.locationAlways.request();
       // await Permission.locationWhenInUse.request();
      if (await Permission.location.serviceStatus.isEnabled)return true;
      debugPrint("checkLocationPermission ${await Permission.location.serviceStatus.isEnabled}");
      return false;
    }catch(e){
      debugPrint("checkLocationPermission $e");
      return false;
    }
  }


  /// language functions
  static void changeLang({required BuildContext ctx,required String lng}){
    HiveBoxes.setUserLng(userLng: lng);
    // changeLocale(ctx,lng);
  }

  static selectLang({required BuildContext context})async{
    // return showFlexibleBottomSheet(
    //   decoration: const BoxDecoration(
    //     color: Colors.white,
    //     borderRadius:  BorderRadius.only(
    //       topRight:  Radius.circular(40),
    //       topLeft:  Radius.circular(40),
    //     ),
    //   ),
    //   duration: const Duration(milliseconds: 600),
    //   barrierColor: Colors.transparent.withOpacity(0.5),
    //   bottomSheetColor: Colors.transparent,
    //   minHeight: 0,
    //   initHeight: 0.2,
    //   maxHeight: 0.2,
    //   context: context,
    //   builder: (ctx, ScrollController scrollController, bottomSheetOffset,)=> SizedBox(
    //     height: 150.h,
    //     child: const ChangeLanguageWidget(),
    //   ),
    // );
  }

  static material.TextDirection langDir(){
    return HiveBoxes.getUserLng()=="ar"? material.TextDirection.rtl:material.TextDirection.ltr;
  }
  // return date in this format ->  2 - November
  static String formatToDayMonth(DateTime date) {
    return "${DateFormat('d - MMMM').format(date.toLocal())} ${date.year}" ;
  }

  // return time in this format ->  5:30 PM
  static String formatTimeToHMPMorAM(DateTime date) {
    return DateFormat('h:mm a').format(date.toLocal());
  }

  static bool isToday(DateTime dateTime){
    if(DateTime.now().year==dateTime.year&&DateTime.now().month==dateTime.month
        &&DateTime. now().day==dateTime.day){
      return true;
    }
    return false;
  }

  //location util
  static Future<Placemark> getAndSaveLocationDetails(LatLng latLng)async{
    try{
      List<Placemark> places = await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
      Placemark place = places[0];
      return place;
    }catch(e){
      debugPrint("getAndSaveLocationDetails $e");
      return Placemark();
    }
  }

  // static Future<Placemark> getAndSaveLocationDetailsHuawei(huawei_map.LatLng latLng)async{
  //   try{
  //     List<Placemark> places = await placemarkFromCoordinates(latLng.lat, latLng.lng);
  //     Placemark place = places[0];
  //     return place;
  //   }catch(e){
  //     debugPrint("getAndSaveLocationDetails $e");
  //     return Placemark();
  //   }
  // }

  static double calcDistance(double startLatitude,double startLongitude,double endLatitude,double endLongitude){
    return Geolocator.distanceBetween(startLatitude, startLongitude, endLatitude, endLongitude);
  }

  // static Future<bool> isHuawei()async{
  //   if(Platform.isIOS)return false;
  //   bool? res =  await GoogleHuaweiAvailability.isHuaweiServiceAvailable;
  //   return res??false;
  // }

}
