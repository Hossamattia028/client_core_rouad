import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/core/util/snackbars_builder.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_button.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text_form_field.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/global_widgets.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/review.dart';
import 'package:client_core/features/presentation/widgets/rating_widgets/person_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';

class RatingScreen extends StatelessWidget {
  const RatingScreen({Key? key}) : super(key: key);
  static final TextEditingController reviewTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimary,
        appBar: GlobalAppBar(
          title: translate("activity_setting.rating"),
          backGroundColor: Colors.grey.shade100,
          textColor: Colors.white,
          height: 75,
        ),
        body: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50.h,left: 30.w,right: 30.w,bottom: 30.w),
                  padding: EdgeInsets.symmetric(vertical: 50.h,horizontal: 20.w),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "Hey Guest",
                        color: Colors.black,
                        fontSize: AppStyle.average.sp,
                        fontWeight: FontWeight.w800,
                      ),
                      const SizedBox(height: 10,),
                      CustomText(
                        text: "Location",
                        color: Colors.black54,
                        fontSize: AppStyle.small.sp,
                      ),
                      const SizedBox(height: 20,),
                      CustomText(
                        text: translate("activity_setting.what_rating"),
                        color: Colors.black,
                        fontSize: AppStyle.average.sp,
                        fontWeight: FontWeight.w800,
                      ),
                      const SizedBox(height: 20,),
                      SizedBox(
                        width: 200.w,
                        child: CustomText(
                          text: translate("activity_setting.your_feedback_improve"),
                          color: Colors.black45,
                          fontSize: AppStyle.small.sp,
                          fontWeight: FontWeight.w600,
                          alignCenter: true,
                        ),
                      ),
                      const SizedBox(height: 20,),
                      ReviewsWidget(amount: 90, color: Colors.amber, size: 30.w),
                      const SizedBox(height: 20,),
                      CustomTextFromField(
                        hintText: translate("activity_setting.additional_comments"),
                        labelText: "",
                        maxLines: 5,
                        backGround: Colors.grey.shade200,
                        onChanged: (val){},
                        hasBorder: true,
                        cursorColor: kPrimary,
                        radius: 10,
                        textEditingController: reviewTextEditingController,
                        validator: (){},
                        obscureText: false,
                        isLabelError: false,
                      ),
                      const SizedBox(height: 20,),
                      CustomButton(
                        height: 40.h,
                        width: double.infinity,
                        circular: 10,
                        widget: CustomText(
                          color: Colors.white,
                          fontSize: AppStyle.small.sp,
                          fontWeight: FontWeight.w600,
                          text: translate("activity_setting.submit_review"),
                        ),
                        color: kPrimary,
                        onPressed: () async {
                          if(reviewTextEditingController.text.trim().isNotEmpty){

                          }else{
                            return SnackBarBuilder.showFeedBackMessage(context, translate("toast.field_empty"), Colors.red);
                          }
                        },
                      ),

                    ],
                  ),
                ),
                const PersonCard(),
              ],
            ),
          ),
        )
    );
  }
}
