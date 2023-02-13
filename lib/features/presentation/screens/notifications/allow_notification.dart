import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_button.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';

class AllowNotificationScreen extends StatelessWidget {
  const AllowNotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 250.h,
            decoration: const BoxDecoration(
              color: kPrimary,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30)
              ),
            ),
            child:  GlobalAppBar(
              title: translate("profile.wishlist"),
              backGroundColor: Colors.grey.shade100,
              height: 75,
            ),
          ),
          Container(
            height: 250.h,
            width: 330.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(15),
            margin: EdgeInsets.symmetric(vertical: 200.h),
            child: Column(
              children: [
                const SizedBox(height: 15,),
                CustomText(
                  text: "Simple Design",
                  color: Colors.black,
                  fontSize: AppStyle.large.sp,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 35,),
                CustomText(
                  text: translate("notification.allow_notification"),
                  color: Colors.black,
                  fontSize: AppStyle.small.sp + 1,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  width: 160.w,
                  child: CustomText(
                    text: translate("notification.sure_to_allow"),
                    color: Colors.black12,
                    fontSize: AppStyle.small.sp,
                    fontWeight: FontWeight.w500,
                    alignCenter: true,
                  ),
                ),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                        height: 35.h,
                        width: 100.w,
                        circular: 5,
                        widget: CustomText(
                          text: translate("notification.yes_allow"),
                          color: Colors.white,
                          fontSize: AppStyle.small.sp,
                        ),
                        color: kPrimary,
                        onPressed: (){},
                    ),
                    CustomButton(
                      height: 35.h,
                      width: 100.w,
                      circular: 5,
                      sideWidth: 2,
                      sideColor: kPrimary,
                      widget: CustomText(
                        text: translate("button.no"),
                        color: Colors.black,
                        fontSize: AppStyle.small.sp,
                      ),
                      color: Colors.white,
                      onPressed: (){},
                    ),
                  ],
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
