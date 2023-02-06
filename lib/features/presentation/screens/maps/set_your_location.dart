import 'package:client_core/core/strings/app_images.dart';
import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_button.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';

class SetYourLocation extends StatelessWidget {
  const SetYourLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 10,),
          Container(
              margin: EdgeInsets.all(20.w),
              height: 410.h,
              decoration: const BoxDecoration(
                borderRadius:
                 BorderRadius.all(Radius.circular(18)),
                image: DecorationImage(
                  image: AssetImage(
                    AppImages.setLocation,
                  ),
                  fit: BoxFit.cover,
                ),
              )),
          SizedBox(
            height: 25.h,
          ),
          CustomText(
            text: translate("store.order_your_favourite_food"),
            color: Colors.black,
            fontSize: AppStyle.average.sp,
            alignCenter: true,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: 40.w,
                ),
                child: CustomButton(
                  height: 30.h,
                  width: 180.w,
                  circular: 5,
                  widget: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: translate("store.use_your_location"),
                        color: Colors.white,
                        fontSize: AppStyle.small.sp,
                      ),
                      const SizedBox(width: 4,),
                      const Icon(Icons.location_on,size: 14,),
                    ],
                  ),
                  color: kPrimary,
                  onPressed: () async{
                    // if(await Util.isHuawei()){
                    //   Get.to(() => HuaweiMapScreen(isSet: true,title: translate("store.use_your_location")));
                    // }else{
                    //   Get.to(() => MapScreen(isSet: true,title: translate("store.use_your_location")));
                    // }
                  }),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
