import 'package:client_core/core/util/hive_boxes.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/styles/constants.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';

class NotificationListCard extends StatelessWidget {
  const NotificationListCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                height: 140.h,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                    image: NetworkImage(Constants.img),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                height: 30.h,
                width: 55.w,
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 20.h),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),topLeft: Radius.circular(20))
                ),
                child: CustomText(
                  text: "only 15%",
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: AppStyle.verySmall.sp,
                ),
              )
            ],
          ),
          const SizedBox(height: 10,),
          CustomText(
            text: "Package name",
            color: Colors.black,
            fontSize: AppStyle.small.sp,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(height: 7,),
          CustomText(
            text: "Package description",
            color: kText1,
            fontWeight: FontWeight.w400,
            fontSize: AppStyle.verySmall.sp,
          ),
          const SizedBox(height: 12,),
          CustomButton(
            height: 35.h,
            width: double.infinity,
            circular: 6,
            widget: CustomText(
              text: translate("order.order_now"),
              color: Colors.white,
              fontSize: AppStyle.small.sp,
              fontWeight: FontWeight.w500,
            ),
            color: Colors.black,
            onPressed: (){},
          ),
          const SizedBox(height: 4,),
        ],
      ),
    );
  }
}
