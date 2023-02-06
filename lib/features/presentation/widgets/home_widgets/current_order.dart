import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/styles/constants.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:client_core/features/presentation/widgets/order_widgets/order_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';

class CurrentOrder extends StatelessWidget {
  const CurrentOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 7,),
        ProviderWidget(),
        SizedBox(height: 12,),
        OrderSmallCard(),
        SizedBox(height: 7,),
      ],
    );
  }
}


class ProviderWidget extends StatelessWidget {
  const ProviderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20.w,
          backgroundColor: kPrimary,
          backgroundImage: const NetworkImage(Constants.img,),
        ),
        const SizedBox(width: 13,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Provider name",
              color: Colors.black,
              fontSize: AppStyle.small.sp,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 5,),
            Row(
              children: [
                const Icon(Icons.location_on,color: Colors.red,size: 13,),
                const SizedBox(width: 5,),
                CustomText(
                  text: "United Kingdom",
                  color: kText1,
                  fontSize: AppStyle.small.sp,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
