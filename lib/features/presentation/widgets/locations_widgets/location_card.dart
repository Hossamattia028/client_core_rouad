import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/styles/constants.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:flutter_translate/flutter_translate.dart';

class LocationCardWidget extends StatelessWidget {
  const LocationCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.location_on_sharp,color: Colors.red,size: 17,),
                  CustomText(
                    text: "Work",
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: AppStyle.small.sp,
                  ),
                ],
              ),
              Row(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.edit_note,color: kText1,size: 17,),
                      CustomText(
                        text: translate("button.edit"),
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: AppStyle.verySmall.sp,
                      ),
                    ],
                  ),
                  const SizedBox(width: 10,),
                  Row(
                    children: [
                      const Icon(Icons.delete,color: kText1,size: 15,),
                      CustomText(
                        text: translate("button.remove"),
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: AppStyle.verySmall.sp,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12,),
          SmallLineLocationData(
            title: translate("profile.name"),
            value: 'mohammed',
          ),
          const SizedBox(height: 7,),
          SmallLineLocationData(
            title: translate("profile.address"),
            value: 'Location',
          ),
          const SizedBox(height: 7,),
          SmallLineLocationData(
            title: translate("profile.mobile"),
            value: '+97100000000000',
          ),
          const SizedBox(height: 5,),


        ],
      ),
    );
  }
}


class SmallLineLocationData extends StatelessWidget {
  final String title;
  final String value;
  const SmallLineLocationData({Key? key,required this.title,required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: AppStyle.small.sp -2,
        ),
        const SizedBox(width: 10,),
        CustomText(
          text: value,
          color: kText1,
          fontWeight: FontWeight.w500,
          fontSize: AppStyle.verySmall.sp,
        ),
      ],
    );
  }
}
