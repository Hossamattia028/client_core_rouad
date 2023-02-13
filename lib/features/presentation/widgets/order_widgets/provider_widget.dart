import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:client_core/features/presentation/widgets/order_widgets/circle_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProviderContactWidget extends StatelessWidget {
  const ProviderContactWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 15.w,
              backgroundColor: kText1,
            ),
            const SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Provider",
                  color: kText1,
                  fontSize: AppStyle.verySmall.sp,
                ),
                const SizedBox(height: 5,),
                CustomText(
                  text: "Brain Cumin",
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: AppStyle.verySmall.sp,
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            CircleIconWidget(iconData: Icons.chat_bubble,onTap: (){},),
            const SizedBox(width: 10,),
            CircleIconWidget(iconData: Icons.call,onTap: (){},),
          ],
        ),
      ],
    );
  }
}
