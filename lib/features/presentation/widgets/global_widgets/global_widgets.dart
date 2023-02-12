

import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/styles/my_fonts.dart';
import 'package:client_core/core/util/hive_boxes.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backGroundColor;
  final bool onlyTitle;
  final Widget? icon;
  final Widget? leadingIcon;
  final double height;
  final Color backIconColor;
  final Color textColor;
  const GlobalAppBar({Key? key,required this.title,required this.backGroundColor,this.icon,this.leadingIcon,this.onlyTitle=false,this.height=45,this.backIconColor=kPrimary,this.textColor=kPrimary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: Size(double.infinity, 100.h),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          margin: const EdgeInsets.only(bottom: 10),
          child: Column(
            children: [
              SizedBox(height: AppStyle.paddingFromTop.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      leadingIcon ?? BackArrowButton(color: backIconColor,alignment: Alignment.center,fn:()=> Navigator.of(context).pop(),),
                      CustomText(
                          text: title,
                          color: textColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: primaryFont,
                          fontSize: AppStyle.average.sp),
                    ],
                  ),
                  icon ?? const SizedBox.shrink()
                ],
              ),
            ],
          ),
        ));
  }
  @override
  Size get preferredSize => Size.fromHeight(height.h);
}

class ChatPersonIcon extends StatelessWidget {
  const ChatPersonIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 20,
        // child: Image.asset(
        //   AppImages.iconChat,
        //   fit: BoxFit.contain,
        // ),
      ),
    );
  }
}

class BackArrowButton extends StatelessWidget {
  final VoidCallback fn;
  final Color color;
  final Alignment alignment;
  const BackArrowButton({Key? key,required this.alignment,required this.color,required this.fn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: IconButton(
          onPressed: fn,
          alignment: alignment,
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          icon: Container(
            alignment: Alignment.center,
            height: 30.h,
            width: 28.w,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Icon(
              Icons.arrow_back,
              color: color,
              size: 22.w,
            ),
          )
      ),
    );
  }
}



class GlobalAppBarLogo extends StatelessWidget {
  final bool isWhite;
  final EdgeInsets? padding;
  final VoidCallback backIconFn;
  const GlobalAppBarLogo({Key? key,required this.isWhite,this.padding=EdgeInsets.zero,required this.backIconFn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding!,
      child: Column(
        children: [
          SizedBox(height: AppStyle.paddingFromTop.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BackArrowButton(color: Colors.white,alignment: Alignment.center,fn:()=> backIconFn,),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Image.asset(isWhite?AppImages.whiteLogo:AppImages.logo,height: 55.h,alignment: Alignment.center,),
                    SizedBox(width: 25.w,),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 30,),
        ],
      ),
    );
  }
}

