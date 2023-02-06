import 'package:client_core/core/strings/app_images.dart';
import 'package:flutter/material.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';


class PasswordChangedSuccessfully extends StatelessWidget {
  const PasswordChangedSuccessfully({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.h,
      width: 400.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // const SizedBox(height: 35,),
          // Image.asset(AppImages.passChanged,height: 65.h,fit: BoxFit.cover,),
          // const SizedBox(height: 20,),
          // CustomText(
          //     text: translate("toast.pass_changed_successfully"),
          //     color: Colors.black45,
          //     fontFamily: primaryFont,
          //     fontSize: AppStyle.small.sp),
          // const SizedBox(height: 5,),
          // CustomText(
          //     text: translate("toast.sign_in"),
          //     color: kText2,
          //     fontFamily: primaryFont,
          //     fontSize: AppStyle.verySmall.sp),
        ],
      ),
    );
  }
}
