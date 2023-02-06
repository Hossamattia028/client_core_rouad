import 'package:client_core/core/strings/app_images.dart';
import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/styles/constants.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/align_child_by_row.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_button.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/review.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';

class HomeLastOrder extends StatelessWidget {
  const HomeLastOrder({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: translate("home.last_order"),
              color: Colors.black,
              fontSize: AppStyle.small.sp,
              fontWeight: FontWeight.w800,
            ),
            CustomText(
              text: translate("home.view_all"),
              color: Colors.black54,
              fontSize: AppStyle.verySmall.sp,
              textDecoration: TextDecoration.underline,
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
                height: 190.h,
                width: double.infinity,
                child: ListView.separated(
                  itemCount: 10,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 200.w,
                        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 6.w),
                        decoration: BoxDecoration(
                          color: kBackGround.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 130.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                      image: NetworkImage(Constants.img),
                                      fit: BoxFit.fill
                                  )
                              ),
                            ),
                            const SizedBox(height: 5,),
                            CustomText(
                              text: "Service name $index",
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: AppStyle.verySmall.sp,
                            ),
                            const SizedBox(height: 7,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(CupertinoIcons.refresh_thick,color: Colors.amber,size: 12.w,),
                                    CustomText(
                                      text: translate("order.re_order"),
                                      color: kPrimary,
                                      fontSize: AppStyle.verySmall.sp,
                                    ),
                                  ],
                                ),
                                CustomText(
                                  text: "25 ${translate("home.aed")}",
                                  color: Colors.black,
                                  fontSize: AppStyle.verySmall.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                    width: 15,
                  ),
                )
            ),

          ],
        ),
      ],
    );
  }
}
