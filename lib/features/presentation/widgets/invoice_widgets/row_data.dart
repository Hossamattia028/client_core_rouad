import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowDataLine extends StatelessWidget {
  final bool isSpaceBetween;
  final bool isTextBlack;
  final bool isValueBlack;
  final String title ;
  final String value ;
  const RowDataLine({Key? key,required this.isSpaceBetween,required this.isTextBlack,required this.isValueBlack,required this.title,required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isSpaceBetween?MainAxisAlignment.spaceBetween:MainAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          fontSize: AppStyle.small.sp,
          color: isTextBlack?Colors.black:kText1,
          fontWeight: FontWeight.w600,
        ),
        if(!isSpaceBetween)const SizedBox(width: 10,),
        CustomText(
          text: value,
          fontSize: AppStyle.small.sp,
          color: isValueBlack?Colors.black:kText1,
          fontWeight: FontWeight.w500,
        ),

      ],
    );
  }
}
