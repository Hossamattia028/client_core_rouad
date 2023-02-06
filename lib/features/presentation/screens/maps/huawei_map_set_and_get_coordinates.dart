// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_translate/flutter_translate.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:huawei_map/map.dart';

//
// class HuaweiMapScreen extends StatefulWidget {
//   final String title;
//   final String? longitude, latitude;
//   final bool isSet;
//   const HuaweiMapScreen({
//     Key? key,
//     this.longitude,
//     this.latitude,
//     required this.isSet,
//     required this.title,
//   }) : super(key: key);
//   @override
//   State<StatefulWidget> createState() {
//     return HuaweiMapScreenState();
//   }
// }
//
// class HuaweiMapScreenState extends State<HuaweiMapScreen> {
//   final Completer<HuaweiMapController> _controller = Completer();
//   late HuaweiMapController mapController;
//   Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
//   LatLng? lastLocation;
//   String latitude = '', longitude = '';
//   String selectedAddress = "";
//
//   @override
//   void initState() {
//     super.initState();
//     HuaweiMapInitializer.initializeMap();
//     _setUp();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: redColor,
//           centerTitle: true,
//           title: CustomText(
//             text: widget.title,
//             fontSize: AppStyle.small.sp,
//             color: Colors.white,
//           ),
//         ),
//         body: Stack(
//           children: [
//             HuaweiMap(
//               mapType: MapType.terrain,
//               compassEnabled: true,
//               myLocationButtonEnabled: true,
//               myLocationEnabled: true,
//               onMapCreated: onMapCreated,
//              onClick: _handleTap,
//               logoPadding: const EdgeInsets.only(top: 30, left: 20),
//               logoPosition: HuaweiMap.UPPER_LEFT,
//               markers: Set<Marker>.of(markers.values),
//               initialCameraPosition: CameraPosition(target: lastLocation ?? const LatLng(24.7255553, 46.5423463), zoom: 10),
//             ),
//             // if (widget.title == translate("store.use_your_location") &&
//             //     selectedAddress != "")
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Padding(
//                   padding: const EdgeInsets.all(30.0),
//                   child: CustomButton(
//                       height: 40.h,
//                       width: 250.w,
//                       color: redColor,
//                       circular: 5,
//                       onPressed: () {
//                         if (lastLocation == null) return Util.snackBar(msg: translate("toast.select_location"), color: redColor);
//                         if(widget.title == translate("store.use_your_location")){
//                           _handleTap(lastLocation!);
//                           Get.to(() => const HomePage());
//                         }else{
//                           Navigator.pop(context, lastLocation);
//                         }
//                       },
//                       widget: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(
//                                 Icons.location_on,
//                                 size: 7.w,
//                               ),
//                               CustomText(
//                                 text: selectedAddress,
//                                 fontSize: AppStyle.verySmall.sp - 2,
//                                 color: Colors.white,
//                               ),
//                             ],
//                           ),
//                           CustomText(
//                             text: translate("store.location_sure_to_use"),
//                             fontSize: AppStyle.small.sp,
//                             color: Colors.white,
//                           ),
//                         ],
//                       )),
//                 ),
//               ),
//           ],
//         ));
//   }
//
//   _setUp() {
//     try {
//       selectedAddress = HiveBoxes.getUserAddress().toString();
//       Util.checkLocationPermission();
//       _setUserCurrentLocation();
//       _setLocationOnMap();
//     } catch (e) {
//       debugPrint("_setUp: $e");
//     }
//   }
//
//   void onMapCreated(HuaweiMapController controller) {
//     setState(() {
//       _controller.complete(controller);
//       mapController = controller;
//     });
//   }
//
//
//   _setLocationOnMap() async {
//     try {
//       if (widget.latitude == null) return;
//       debugPrint("lat & lon location: ${widget.latitude}${widget.longitude}");
//       var markerIdVal = widget.longitude!;
//       final MarkerId markerId = MarkerId(markerIdVal);
//       Marker marker = Marker(
//         markerId: markerId,
//         position: LatLng(double.parse(widget.latitude.toString()),
//             double.parse(widget.longitude.toString())),
//         infoWindow: const InfoWindow(
//           title: '',
//         ),
//         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
//       );
//       setState(() {
//         markers[markerId] = marker;
//       });
//     } catch (e) {
//       debugPrint("_setLocationOnMap: $e");
//     }
//   }
//
//   _handleTap(LatLng point) async {
//     if (widget.isSet == false) return;
//     markers.clear();
//     try {
//       Marker marker = Marker(
//         markerId: MarkerId(point.toString()),
//         position: point,
//         infoWindow: InfoWindow(
//           title: translate("cart.selected"),
//         ),
//         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
//       );
//       setState(() {
//         markers[MarkerId(point.toString())] = marker;
//       });
//       LatLng latLng = LatLng(point.lat, point.lng);
//       if (widget.title == translate("store.use_your_location")) {
//         _checkIFUserLocation(
//             await Util.getAndSaveLocationDetailsHuawei(latLng), latLng);
//       } else {
//         Navigator.pop(context, point);
//       }
//     } catch (e) {
//       debugPrint("_handleTap: $e");
//     }
//   }
//
//   _setUserCurrentLocation() async {
//     if (widget.longitude == null) {
//       markers.clear();
//       Position position = await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.high);
//       Marker marker = Marker(
//         markerId: MarkerId(position.toString()),
//         position: LatLng(position.latitude, position.longitude),
//         infoWindow: InfoWindow(
//           title: translate("profile.your_current_location"),
//         ),
//         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
//       );
//       if(mounted){
//         setState(() {
//           markers[MarkerId(position.toString())] = marker;
//           lastLocation = LatLng(position.latitude, position.longitude);
//         });
//       }
//     } else {
//       latitude = widget.latitude!;
//       longitude = widget.longitude!;
//       lastLocation = LatLng(double.parse(latitude.toString()),
//           double.parse(longitude.toString()));
//     }
//     if(mounted){
//       Timer(const Duration(milliseconds: 100), () async {
//         mapController.animateCamera(CameraUpdate.newLatLngZoom(lastLocation!, 14));
//         _checkIFUserLocation(await Util.getAndSaveLocationDetailsHuawei(lastLocation!), lastLocation!);
//       });
//     }
//   }
//
//   _checkIFUserLocation(Placemark data, LatLng latLng) {
//     try {
//       if (widget.title == translate("store.use_your_location")) {
//         HiveBoxes.setUserAddress(userAddress: "${data.country}-${data.subLocality}-${data.street}-${data.administrativeArea}".toString().replaceAll("null", "").trim());
//         HiveBoxes.setUserLat(userLat: latLng.lat.toString());
//         HiveBoxes.setUserLong(userLng: latLng.lng.toString());
//         // debugPrint("\n--- ${HiveBoxes.getUserAddress()} ---\n");
//       }
//       if(mounted) {
//         setState(() {
//           selectedAddress = "${data.country}-${data.subLocality}-${data.street}-${data.administrativeArea}";
//         });
//       }
//     } catch (e) {
//       debugPrint("_checkIFUserLocation $e");
//     }
//   }
// }
