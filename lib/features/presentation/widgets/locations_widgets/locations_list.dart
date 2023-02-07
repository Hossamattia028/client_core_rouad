import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/locations_widgets/location_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationsList extends StatelessWidget {
  const LocationsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      padding: EdgeInsets.symmetric(horizontal: AppStyle.paddingFromH.sp,vertical: 5.h),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: const LocationCardWidget(),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 15,),
    );
  }
}
