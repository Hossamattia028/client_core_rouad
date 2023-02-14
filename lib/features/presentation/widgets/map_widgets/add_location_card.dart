import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';

class AddLocationCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const AddLocationCard({Key? key,required this.title,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> onTap,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [

          Container(
            margin: const EdgeInsets.only(top: 35),
            padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 15.h),
            decoration:  BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Colors.grey.shade200,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  text: title,
                  fontSize: AppStyle.small.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                CustomText(
                  text: translate("map.set_location"),
                  fontSize: AppStyle.verySmall.sp - 1,
                  color: kText1,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: const Icon(Icons.add,color: Colors.white,),
          ),

        ],
      ),
    );
  }
}
