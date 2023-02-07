import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/styles/constants.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';

class OrderListCard extends StatelessWidget {
  const OrderListCard({Key? key}) : super(key: key);

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
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 5,),
                  CustomText(
                    text: "Completed",
                    color: kText1,
                    fontWeight: FontWeight.w600,
                    fontSize: AppStyle.verySmall.sp,
                  ),
                  CustomText(
                    text: "20 November 2023 14:30",
                    color: kText1,
                    fontSize: AppStyle.verySmall.sp,
                  ),
                  const SizedBox(height: 5,),
                  Row(
                    children: [
                      InkWell(
                        onTap: (){},
                        child: Row(
                          children: [
                            Icon(CupertinoIcons.refresh_thick,color: kPrimary,size: 12.w,),
                            CustomText(
                              text: translate("order.re_order"),
                              color: kText1,
                              fontSize: AppStyle.verySmall.sp,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10,),
                      InkWell(
                        onTap: (){},
                        child: Row(
                          children: [
                            Icon(Icons.star_rate_outlined,color: kPrimary,size: 12.w,),
                            CustomText(
                              text: translate("order.rate"),
                              color: kText1,
                              fontSize: AppStyle.verySmall.sp,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        const Icon(Icons.arrow_forward_ios,color: kPrimary,size: 18,),
      ],
    );
  }
}
