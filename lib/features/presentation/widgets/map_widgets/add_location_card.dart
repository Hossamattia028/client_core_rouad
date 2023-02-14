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
        alignment: Alignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            child: const Icon(Icons.add,color: Colors.white,),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: EdgeInsets.only(top: 20.h),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: kText1,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  text: title,
                  fontSize: AppStyle.average.sp,
                  color: Colors.black,
                ),
                CustomText(
                  text: translate("map.set_location"),
                  fontSize: AppStyle.small.sp,
                  color: kText1,
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
