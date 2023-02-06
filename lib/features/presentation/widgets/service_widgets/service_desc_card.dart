import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/styles/constants.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceDescriptionCard extends StatelessWidget {
  const ServiceDescriptionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration:  BoxDecoration(
          color: kBackGround.withOpacity(0.04),
          borderRadius: const BorderRadius.all(Radius.circular(10))
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80.h,
            width: 70.w,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                    image: NetworkImage(Constants.img),
                    fit: BoxFit.fill
                )
            ),
          ),
          const SizedBox(width: 7,),
          Column(
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
            ],
          ),
        ],
      ),
    );
  }
}
