import 'package:client_core/core/strings/app_images.dart';
import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/styles/constants.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/align_child_by_row.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_button.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';

class HomeMostPopularServices extends StatelessWidget {
  const HomeMostPopularServices({Key? key}) : super(key: key);
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
              text: translate("home.most_popular"),
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
                          Stack(
                            alignment: Alignment.topRight,
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
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 12.w,
                                  child: Icon(Icons.favorite,color: kPrimary,size: 15.w,),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                  text: "Service name $index",
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppStyle.verySmall.sp,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.star,color: Colors.amber,size: 10.w,),
                                  const Text("5.0",style: TextStyle(color: kBackGround),)
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 5,),
                          SizedBox(
                            width: 100.w,
                            child: CustomText(
                                text: "service description",
                                color: kBackGround,
                                fontSize: AppStyle.verySmall.sp,
                                ellipsis: true,
                            ),
                          ),
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
