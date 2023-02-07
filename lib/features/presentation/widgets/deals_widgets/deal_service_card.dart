import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/styles/constants.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:flutter_translate/flutter_translate.dart';

class DealServiceCard extends StatelessWidget {
  const DealServiceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: "offer for service",
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: AppStyle.small.sp - 1,
          ),
          const SizedBox(height: 5,),
          CustomText(
            text: "offer details",
            color: kText1,
            fontWeight: FontWeight.w400,
            fontSize: AppStyle.verySmall.sp,
          ),
          const SizedBox(height: 15,),
          Row(
            children: [
              CustomText(
                text: "200 ${translate("home.aed")}",
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: AppStyle.verySmall.sp,
              ),
              const SizedBox(width: 5,),
              CustomText(
                text: "400 ${translate("home.aed")}",
                color: kText1,
                fontSize: AppStyle.verySmall.sp,
                textDecoration: TextDecoration.lineThrough,
              ),
            ],
          )

        ],
      ),
    );
  }
}
