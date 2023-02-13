import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/styles/constants.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';

class PackageCheckOutListCard extends StatelessWidget {
  const PackageCheckOutListCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50.h,
                width: 52.w,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                    image: NetworkImage(Constants.img),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Package name",
                    color: Colors.black,
                    fontSize: AppStyle.small.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(height: 5,),
                  CustomText(
                    text: "0.00 ${translate("home.aed")}",
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: AppStyle.verySmall.sp,
                  ),

                ],
              ),
            ],
          ),
        ),
        const Icon(Icons.keyboard_control,color: kPrimary,size: 18,),
      ],
    );
  }
}
