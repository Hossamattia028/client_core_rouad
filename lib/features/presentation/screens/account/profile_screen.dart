import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: GlobalAppBar(
        title: translate("profile.my_details"),
        backGroundColor: Colors.grey.shade100,
        height: 75,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: AppStyle.paddingFromH.sp,vertical: AppStyle.paddingFromV.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200.h,
              width: double.infinity,
              padding: const EdgeInsets.all(30),
              decoration: const BoxDecoration(
                  color: kPrimary,
                  borderRadius: BorderRadius.all(Radius.circular(15))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30.w,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person_outline,color: kPrimary,size: 30.w,),
                  ),
                  const SizedBox(height: 10,),
                  CustomText(
                    text: "user name",
                    color: Colors.white,
                    fontSize: AppStyle.small.sp,
                    fontWeight: FontWeight.w500,
                  ),

                  CustomText(
                    text: "name@gmail.com",
                    color: Colors.white,
                    fontSize: AppStyle.verySmall.sp,
                  ),

                  const SizedBox(height: 20,),

                ],
              ),
            ),
            const SizedBox(height: 20,),
            CustomText(
              text: "another data",
              color: Colors.black,
              fontSize: AppStyle.verySmall.sp,
            ),

          ],
        ),
      ),
    );
  }
}
