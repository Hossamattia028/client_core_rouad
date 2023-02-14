import 'dart:async';
import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/core/util/small_functions.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:client_core/features/presentation/widgets/map_widgets/add_location_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  final String title;
  final String? longitude, latitude;
  final bool isSet;
  const MapScreen({
    Key? key,
    this.longitude,
    this.latitude,
    required this.isSet,
    required this.title,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return MapScreenState();
  }
}

class MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController mapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  LatLng? lastLocation;
  String latitude = '', longitude = '';
  String selectedAddress = "";

  @override
  void initState() {
    super.initState();
    _setUp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimary,
          iconTheme: const  IconThemeData(color: Colors.white),
          centerTitle: true,
          title: CustomText(
            text: widget.title,
            fontSize: AppStyle.small.sp,
            color: Colors.white,
          ),
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(target: lastLocation ?? const LatLng(24.7255553, 46.5423463), zoom: 10),
              onMapCreated: onMapCreated,
              onCameraMove: _onCameraMoved,
              myLocationEnabled: true,
              mapType: MapType.normal,
              tiltGesturesEnabled: true,
              compassEnabled: true,
              scrollGesturesEnabled: true,
              zoomGesturesEnabled: true,
              markers: Set<Marker>.of(markers.values),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              height: 140.h,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  CustomText(
                    text: translate("map.add_location"),
                    fontSize: AppStyle.average.sp,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AddLocationCard(title: translate("map.work"), onTap: (){}),
                      AddLocationCard(title: translate("map.home"), onTap: (){}),
                      AddLocationCard(title: translate("map.other"), onTap: (){}),
                    ],
                  ),
                  const SizedBox(height: 10,),
                ],
              ),
            )

          ],
        ));
  }

  _setUp() {
    try {
      Util.checkLocationPermission();
    } catch (e) {
      debugPrint("_setUp: $e");
    }
  }

  void onMapCreated(GoogleMapController controller) {
    setState(() {
      _controller.complete(controller);
      mapController = controller;
    });
  }

  void _onCameraMoved(CameraPosition position) {
    lastLocation = position.target;
  }
}
