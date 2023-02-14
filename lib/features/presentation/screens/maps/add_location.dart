import 'dart:async';
import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/core/util/small_functions.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text_form_field.dart';
import 'package:client_core/features/presentation/widgets/map_widgets/add_location_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddLocationScreen extends StatefulWidget {
  const AddLocationScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return AddLocationScreenState();
  }
}

class AddLocationScreenState extends State<AddLocationScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController mapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  LatLng? lastLocation;
  String latitude = '', longitude = '';
  String selectedAddress = "";
  final TextEditingController searchTextEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _setUp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
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
              alignment: Alignment.topCenter,
              height: 40.h,
              margin: const EdgeInsets.all(32),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: CustomTextFromField(
                  hintText: translate("search.search"),
                  labelText: "",
                  onChanged: (val){},
                  hasBorder: false,
                  maxLines: 1,
                  cursorColor: kPrimary,
                  radius: 10,
                  textEditingController: searchTextEditingController,
                  validator: (){},
                  obscureText: false,
                  isLabelError: false,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                height: 170.h,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(18),topRight: Radius.circular(18)),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomText(
                      text: translate("map.add_location"),
                      fontSize: AppStyle.small.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                    const Divider(),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        AddLocationCard(title: translate("map.work"), onTap: (){}),
                        AddLocationCard(title: translate("map.home"), onTap: (){}),
                        AddLocationCard(title: translate("map.other"), onTap: (){}),
                      ],
                    ),
                    const SizedBox(height: 10,),
                  ],
                ),
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
