import 'package:client_core/core/strings/app_images.dart';
import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/styles/constants.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/align_child_by_row.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({Key? key}) : super(key: key);
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
              text: translate("app_bar.categories"),
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
        SizedBox(
            height: 85.h,
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
                    padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                    decoration: BoxDecoration(
                      color: kBackGround.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 17.w,
                          backgroundImage: const NetworkImage(Constants.img),
                        ),
                        const SizedBox(height: 10,),
                        CustomText(
                            text: "Categories $index",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: AppStyle.verySmall.sp),
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
    );
  }
}
