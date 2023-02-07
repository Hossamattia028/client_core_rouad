import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/styles/constants.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderSmallCard extends StatelessWidget {
  const OrderSmallCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(width: 1,color: kText1)
      ),
      child: Row(
        children: [
          Expanded(
              child: Row(
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
                        text: "Service name",
                        color: Colors.black,
                        fontSize: AppStyle.small.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(height: 5,),
                      CustomText(
                        text: "Order number",
                        color: kText1,
                        fontSize: AppStyle.small.sp,
                      ),
                    ],
                  ),
                ],
              ),
          ),
          InkWell(
            onTap: (){},
            child: Row(
              children: [
                CustomText(
                  text: "Track Order",
                  color: kPrimary,
                  fontSize: AppStyle.small.sp -1,
                ),
                const Icon(Icons.arrow_right_alt,color: kPrimary,),
              ],
            )
          ),
        ],
      ),
    );
  }
}
