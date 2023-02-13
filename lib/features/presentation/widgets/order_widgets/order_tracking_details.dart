import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:client_core/features/presentation/widgets/order_widgets/circle_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';

class OrderTrackingDetails extends StatelessWidget {
  const OrderTrackingDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            CircleIconWidget(iconData: Icons.access_time_filled,onTap: (){},),
            Container(
              height: 30.h,
              width: 2,
              color: kText1,
            ),
            CircleIconWidget(iconData: Icons.access_time_filled,onTap: (){},),
          ],
        ),
        const SizedBox(width: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: translate("order.time"),
                  color: kText1,
                  fontSize: AppStyle.verySmall.sp,
                ),
                const SizedBox(height: 5,),
                CustomText(
                  text: "3:40 AM",
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: AppStyle.verySmall.sp,
                ),
              ],
            ),
            SizedBox(height: 30.h,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: translate("order.place"),
                  color: kText1,
                  fontSize: AppStyle.verySmall.sp,
                ),
                const SizedBox(height: 5,),
                CustomText(
                  text: "200 Central Park,42-872",
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: AppStyle.verySmall.sp,
                ),
              ],
            ),
          ],
        ),

      ],
    );
  }
}
