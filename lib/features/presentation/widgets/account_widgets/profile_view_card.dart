import 'package:client_core/core/strings/app_images.dart';
import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';

class ProfileCardView extends StatelessWidget {
  const ProfileCardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  height: 60.h,
                  width: 55.w,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: kText1,
                    // image: DecorationImage(
                    //   image: NetworkImage(AppImages.setLocation),
                    //   fit: BoxFit.contain
                    // ),
                  ),
                ),
                const SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "User name",
                      color: kPrimary,
                      fontSize: AppStyle.small.sp,
                      fontWeight: FontWeight.w800,
                    ),
                    const SizedBox(height: 5,),
                    CustomText(
                      text: translate("profile.view"),
                      color: kText1,
                      fontSize: AppStyle.small.sp,
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.arrow_forward_ios,size: 13.w,),
          ),
        ],
      ),
    );
  }
}
