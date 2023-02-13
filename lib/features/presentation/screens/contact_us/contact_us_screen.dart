
import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/core/util/small_functions.dart';
import 'package:client_core/core/util/snackbars_builder.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_button.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text_form_field.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';



class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  static final TextEditingController nameTextEditingController = TextEditingController();
  static final TextEditingController mobileTextEditingController = TextEditingController();
  static final TextEditingController emailTextEditingController = TextEditingController();
  static final TextEditingController contentTextEditingController = TextEditingController();

  @override
  void initState() {
    dropDownMenu = getDropDownMenu();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: GlobalAppBar(
        title: translate("activity_setting.contact_us"),
        backGroundColor: Colors.grey.shade100,
        textColor: Colors.white,
        height: 75,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child:  Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     CustomText(text: "966", color: Colors.black45, fontSize: AppStyle.verySmall.sp),
              //     IconButton(
              //       onPressed: ()=>Util.sendWhatsApp('966', ''),
              //       icon: Icon(Icons.person_outline,color: Colors.green,size: 30.w,),
              //     ),
              //   ],
              // ),
              // const Divider(),
              // const SizedBox(height: 10,),
              Container(
                height: 50.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1,color: Colors.grey),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child:  DropdownButton(
                  isExpanded: true,
                  style: TextStyle(color: Colors.black, fontSize: 12.sp,),
                  hint: CustomText(
                    text: translate("activity_setting.select_subject"),
                    fontSize: 12.sp,
                    color: Colors.black,
                  ),
                  onChanged:(val){
                    setState(() {
                      subject = val.toString();
                    });
                  },
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items:  dropDownMenu,
                  value: subject,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50.h,
                child: CustomTextFromField(
                    hintText: translate("signup.username"),
                    labelText: translate("signup.username"),
                    radius: 10,
                    textEditingController: nameTextEditingController,
                    validator: () {},
                    onChanged: (val){},
                    prefixIcon: null,
                    cursorColor: Colors.black,
                    hasBorder: true,
                    suffixIcon: const SizedBox(),
                    obscureText: false,
                    isLabelError: false),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50.h,
                child: CustomTextFromField(
                    hintText: translate("signup.phone"),
                    labelText: translate("signup.phone"),
                    radius: 10,
                    textEditingController: mobileTextEditingController,
                    validator: () {},
                    prefixIcon: null,
                    cursorColor: Colors.black,
                    hasBorder: true,
                    suffixIcon: const SizedBox(),
                    obscureText: false,
                    isLabelError: false,
                    onChanged: (val){},),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50.h,
                child: CustomTextFromField(
                    hintText: translate("login.email"),
                    labelText: translate("login.email"),
                    radius: 10,
                    onChanged: (val){},
                    textEditingController: emailTextEditingController,
                    validator: () {},
                    prefixIcon: null,
                    cursorColor: Colors.black,
                    hasBorder: true,
                    suffixIcon: const SizedBox(),
                    obscureText: false,
                    isLabelError: false),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 70.h,
                child: CustomTextFromField(
                    hintText: translate("activity_setting.content"),
                    labelText: translate("activity_setting.content"),
                    radius: 10,
                    maxLines: 4,
                    textEditingController: contentTextEditingController,
                    validator: () {},
                    onChanged: (val){},
                    prefixIcon: null,
                    cursorColor: Colors.black,
                    hasBorder: true,
                    suffixIcon: const SizedBox(),
                    obscureText: false,
                    isLabelError: false),
              ),

              const SizedBox(
                height: 30,
              ),
              CustomButton(
                height: 40.h,
                width: double.infinity,
                circular: 10,
                widget: CustomText(
                  color: Colors.white,
                  fontSize: AppStyle.small.sp,
                  fontWeight: FontWeight.w600,
                  text: translate("button.send").toUpperCase(),
                ),
                color: kPrimary,
                onPressed: () async {
                  if(emailTextEditingController.text.isNotEmpty&&
                      nameTextEditingController.text.isNotEmpty&&
                      mobileTextEditingController.text.isNotEmpty&&
                      contentTextEditingController.text.isNotEmpty
                  ){
                    // await ct.setContactEmail(
                    //     subject: subject,
                    //     userDetails: "name: ${nameTextEditingController.text.trim()}\n  phone: ${mobileTextEditingController.text.trim()}\n",
                    //     bodyMsg: "message: \n ${contentTextEditingController.text.trim()}",
                    //     userEmail: emailTextEditingController.text.trim()
                    // );
                    contentTextEditingController.text="";
                  }else{
                    return SnackBarBuilder.showFeedBackMessage(context, translate("toast.field_empty"), Colors.red);
                  }
                },
              ),

              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> dropDownMenu = [];
  String subject = translate("activity_setting.ques");
  List<DropdownMenuItem<String>> getDropDownMenu() {
    List<DropdownMenuItem<String>> itemsMarketKind = [];
    itemsMarketKind.add(DropdownMenuItem(
      value: translate("activity_setting.ques"),
      child: CustomText(
        text: translate("activity_setting.ques"),
        fontSize: 12.sp,
        color: Colors.black,
      ),
    ));
    itemsMarketKind.add(DropdownMenuItem(
      value: translate("activity_setting.feedback"),
      child: CustomText(
        text: translate("activity_setting.feedback"),
        fontSize: 12.sp,
        color: Colors.black,
      ),
    ));
    itemsMarketKind.add(DropdownMenuItem(
      value: translate("activity_setting.suggestion"),
      child: CustomText(
        text: translate("activity_setting.suggestion"),
        fontSize: 12.sp,
        color: Colors.black,
      ),
    ));
    return itemsMarketKind;
  }
}

