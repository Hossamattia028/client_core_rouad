import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/styles/constants.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_button.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/global_widgets.dart';
import 'package:client_core/features/presentation/widgets/service_widgets/packages_h_list.dart';
import 'package:client_core/features/presentation/widgets/service_widgets/service_desc_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';

class ServiceDetailsScreen extends StatelessWidget {
  const ServiceDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimary,
        centerTitle: true,
        title: CustomText(
          text: "Service name",
          color: Colors.white,
          fontSize: AppStyle.small.sp,
        ),
        leading: BackArrowButton(color: kPrimary,alignment: Alignment.center,fn:()=> Navigator.of(context).pop(),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            height: 200.h,
            decoration: const BoxDecoration(
              color: kPrimary,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50))
            ),
            child: CustomText(
              text: "Service Description & Photo",
              color: Colors.white,
              fontSize: AppStyle.small.sp -1,
            ),
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: AppStyle.paddingFromH.w,vertical: AppStyle.paddingFromH.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5,),
                CustomText(
                  text: "Service Description",
                  color: kPrimary,
                  fontSize: AppStyle.small.sp,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 5,),
                CustomText(
                  text: "description ....",
                  color: kText1,
                  fontSize: AppStyle.small.sp,
                ),
                const SizedBox(height: 10,),
                const PackagesHList(),
                const SizedBox(height: 12,),
                const ServiceDescriptionCard(),
                const SizedBox(height: 20,),
                CustomButton(
                    height: 45.h,
                    width: double.infinity,
                    widget: CustomText(
                      text: translate("service.book_now"),
                      color: Colors.white,
                      fontSize: AppStyle.small.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    color: Colors.black,
                    onPressed: (){},
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}
