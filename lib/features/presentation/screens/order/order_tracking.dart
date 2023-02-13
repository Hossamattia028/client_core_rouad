import 'package:client_core/features/presentation/widgets/home_widgets/bottom_nav_bar.dart';
import 'package:client_core/features/presentation/widgets/order_widgets/order_tracking_details.dart';
import 'package:client_core/features/presentation/widgets/order_widgets/provider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class OrderTrackingScreen extends StatefulWidget {
  const OrderTrackingScreen({Key? key}) : super(key: key);

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  final Set<Polyline> _polyline = {};
  final Set<Marker> _markers = {};

  @override
  void initState() {
    _markers.add(const Marker(markerId: MarkerId("0"),position:  LatLng(24.9432273, 46.8816334),infoWindow: InfoWindow(title: "Service Provider")));
    _markers.add(const Marker(markerId: MarkerId("0"),position:  LatLng(24.7255553, 46.5423463),infoWindow: InfoWindow(title: "My Order Location")));
    _polyline.add(
        const Polyline(
          polylineId: PolylineId('1'),
          points: [
            LatLng(24.9432273, 46.8816334),
            LatLng(24.7255553, 46.5423463),
          ],
          color: Colors.red,
          width: 4,
        ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const BottomNavBar(),
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(target: LatLng(24.7255553, 46.5423463), zoom: 9),
            myLocationEnabled: true,
            mapType: MapType.normal,
            tiltGesturesEnabled: true,
            compassEnabled: true,
            scrollGesturesEnabled: true,
            zoomGesturesEnabled: true,
            polylines: _polyline,
            markers: _markers,
          ),
          Positioned(
            bottom: 40.h,
            child: Container(
              width: 320.w,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Column(
                children: const [

                  OrderTrackingDetails(),

                  Divider(),

                  ProviderContactWidget(),

                ],
              ),
            ),

          ),
        ],
      ),
    );
  }
}
