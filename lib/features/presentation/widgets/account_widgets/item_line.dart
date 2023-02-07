import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemLineWidget extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback fn;
  final BorderRadius? borderRadius;
  const ItemLineWidget({Key? key,required this.iconData,required this.title,required this.fn,this.borderRadius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius??BorderRadius.zero,
      ),
      padding: EdgeInsets.symmetric(vertical: 4.h,horizontal: 10.w),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Icon(iconData,color: kPrimary.withOpacity(0.7),size: 20.w,),
                const SizedBox(width: 7,),
                CustomText(
                  text: title,
                  color: kPrimary,
                  fontSize: AppStyle.small.sp,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: ()=>fn,
            icon: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 13.w,),
          ),
        ],
      ),
    );
  }
}
