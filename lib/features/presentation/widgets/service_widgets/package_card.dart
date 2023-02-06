import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/styles/constants.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';

class PackageCard extends StatelessWidget {
  const PackageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: kBackGround.withOpacity(0.05),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 17.w,
            backgroundImage: const NetworkImage(Constants.img),
          ),
          const SizedBox(height: 10,),
          CustomText(
              text: "package name",
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: AppStyle.verySmall.sp,
          ),
          const SizedBox(height: 5,),
          CustomText(
            text: "50 ${translate("home.aed")}",
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: AppStyle.verySmall.sp,
          ),
        ],
      ),
    );
  }
}
