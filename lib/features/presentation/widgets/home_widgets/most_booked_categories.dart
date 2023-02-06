import 'package:client_core/core/strings/app_images.dart';
import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/styles/constants.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/align_child_by_row.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_button.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';

class HomeMostBookedCategories extends StatelessWidget {
  const HomeMostBookedCategories({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: translate("home.most_booked_cat"),
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
              height: 215.h,
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
                      width: 170.w,
                      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                      decoration: BoxDecoration(
                          color: kBackGround.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                              text: "Package name $index",
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: AppStyle.verySmall.sp),
                          const SizedBox(height: 5,),
                          CustomText(
                              text: "details $index",
                              color: kBackGround,
                              fontSize: AppStyle.verySmall.sp),
                          const SizedBox(height: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 115.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: const DecorationImage(
                                        image: NetworkImage(Constants.img),
                                        fit: BoxFit.fill
                                    )
                                ),
                              ),
                              const SizedBox(height: 10,),
                              CustomButton(
                                height: 30.h,
                                width: 168.w,
                                circular: 5,
                                widget: CustomText(
                                  text: translate("home.more"),
                                  color: Colors.white,
                                  fontSize: AppStyle.verySmall.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                color: Colors.black,
                                onPressed: (){},
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
                  width: 20,
                ),
              )
            ),

          ],
        ),
      ],
    );
  }
}
