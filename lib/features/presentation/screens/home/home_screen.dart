import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text_form_field.dart';
import 'package:client_core/features/presentation/widgets/home_widgets/bottom_nav_bar.dart';
import 'package:client_core/features/presentation/widgets/home_widgets/categories.dart';
import 'package:client_core/features/presentation/widgets/home_widgets/current_order.dart';
import 'package:client_core/features/presentation/widgets/home_widgets/home_slider.dart';
import 'package:client_core/features/presentation/widgets/home_widgets/last_order.dart';
import 'package:client_core/features/presentation/widgets/home_widgets/most_booked_categories.dart';
import 'package:client_core/features/presentation/widgets/home_widgets/most_popular_service.dart';
import 'package:client_core/features/presentation/widgets/home_widgets/search_widget.dart';
import 'package:client_core/features/presentation/widgets/notifications_widgets/notification_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const BottomNavBar(),
      appBar: AppBar(
        backgroundColor: kBackGround,
        elevation: 0,
        centerTitle: true,
        title: CustomText(
          text: "Logo Company",
          color: Colors.black,
          fontSize: AppStyle.average.sp,
          fontWeight: FontWeight.w500,
        ),
        actions: const [NotificationIcon()],
      ),
      body: Stack(
        children: [
          const GoogleMap(
            initialCameraPosition: CameraPosition(target: LatLng(24.7255553, 46.5423463), zoom: 10),
            myLocationEnabled: true,
            mapType: MapType.normal,
            tiltGesturesEnabled: true,
            compassEnabled: true,
            scrollGesturesEnabled: true,
            zoomGesturesEnabled: true,
          ),
          Padding(
            padding: EdgeInsets.only(top: 100.h),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                // SliverAppBar(
                //   toolbarHeight: 200.h,
                //   backgroundColor: Colors.transparent,
                // ),
                SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                      ),
                      child: Column(
                      children: const[
                        SearchWidget(),
                        CurrentOrder(),
                        HomeSlider(),
                        HomeLastOrder(),
                        HomeCategories(),
                        HomeMostBookedCategories(),
                        HomeMostPopularServices(),
                      ],
                  ),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
