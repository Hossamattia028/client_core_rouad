import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';

class SmallCircleCard extends StatelessWidget {
  final String title;
  final IconData iconData;
  const SmallCircleCard({Key? key,required this.title,required this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 20.w,
          child: Icon(iconData,color: kPrimary,size: 23.w,),
        ),
        const SizedBox(height: 7,),
        CustomText(
          text: title ,
          color: Colors.white,
          fontSize: AppStyle.small.sp -1,
        ),
      ],
    );
  }
}
