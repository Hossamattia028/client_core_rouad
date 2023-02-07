import 'dart:io';
import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/core/util/snackbars_builder.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_button.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text_form_field.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';



class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController firstNameTextEditingController = TextEditingController();
  final TextEditingController lastNameTextEditingController = TextEditingController();
  final TextEditingController emailTextEditingController = TextEditingController();
  final TextEditingController phoneTextEditingController = TextEditingController();


  @override
  void didChangeDependencies() {

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SizedBox(
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppStyle.paddingFromTop.w,),
              BackArrowButton(color: kPrimary,alignment: Alignment.center,fn:()=> Navigator.of(context).pop(),),
              const SizedBox(height: 5,),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: AppStyle.paddingFromH.w+10,vertical: AppStyle.paddingFromV.h),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        height: 60.h,
                        width: 55.w,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: kText1,
                          // image: DecorationImage(
                          //   image: NetworkImage(AppImages.setLocation),
                          //   fit: BoxFit.contain
                          // ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      CustomText(
                        text: translate("profile.change_profile_image"),
                        color: kPrimary,
                        fontSize: AppStyle.small.sp,
                        fontWeight: FontWeight.w800,
                      ),
                      const SizedBox(height: 40,),

                      CustomTextFromField(
                          hintText: translate("profile.first_name"),
                          labelText: "",
                          onChanged: (val){},
                          hasBorder: true,
                          cursorColor: kPrimary,
                          radius: 10,
                          textEditingController: firstNameTextEditingController,
                          validator: (){},
                          obscureText: false,
                          isLabelError: false),
                      const SizedBox(height: 10,),
                      CustomTextFromField(
                          hintText: translate("profile.last_name"),
                          labelText: "",
                          onChanged: (val){},
                          hasBorder: true,
                          cursorColor: kPrimary,
                          radius: 10,
                          textEditingController: firstNameTextEditingController,
                          validator: (){},
                          obscureText: false,
                          isLabelError: false),
                      const SizedBox(height: 10,),
                      CustomTextFromField(
                          hintText: translate("profile.email"),
                          labelText: "",
                          onChanged: (val){},
                          hasBorder: true,
                          cursorColor: kPrimary,
                          radius: 10,
                          textEditingController: emailTextEditingController,
                          validator: (){},
                          obscureText: false,
                          isLabelError: false),
                      const SizedBox(height: 10,),
                      CustomTextFromField(
                          hintText: translate("profile.mobile"),
                          labelText: "",
                          onChanged: (val){},
                          cursorColor: kPrimary,
                          hasBorder: true,
                          radius: 10,
                          textEditingController: phoneTextEditingController,
                          validator: (){},
                          obscureText: false,
                          isLabelError: false),

                      const SizedBox(height: 30,),
                      CustomButton(
                        height: 40.h,
                        width: double.infinity,
                        circular: 10,
                        widget: CustomText(
                          color: Colors.white,
                          fontSize: AppStyle.small.sp,
                          fontWeight: FontWeight.w400,
                          text: "${translate("button.save")} ${translate("profile.changes")}",
                        ),
                        color: kPrimary,
                        onPressed: () async {
                          if(emailTextEditingController.text.trim().isNotEmpty&&firstNameTextEditingController.text.trim().isNotEmpty&&phoneTextEditingController.text.trim().isNotEmpty){

                          }else{
                            return SnackBarBuilder.showFeedBackMessage(context, translate("toast.field_empty"), Colors.red);
                          }
                        },
                      ),
                      const SizedBox(height: 20,),

                    ],
                  ),
                ),
              ),

            ],
          ),
        )
    );
  }




}
