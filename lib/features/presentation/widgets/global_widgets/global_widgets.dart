

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
  const GlobalAppBar({Key? key,required this.title,required this.backGroundColor,this.icon,this.leadingIcon,this.onlyTitle=false}) : super(key: key);

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
                      leadingIcon ?? GlobalWidgets.backArrowButton(()=> Navigator.of(context).pop(), Colors.white,Alignment.center),
                      CustomText(
                          text: title,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
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
  Size get preferredSize => Size.fromHeight(42.h);
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


class GlobalWidgets{
  static Widget backArrowButton(VoidCallback fn,Color color,Alignment alignment){
    return Ink(
      child: IconButton(
        onPressed: fn,
        alignment: alignment,
        padding: const EdgeInsets.only(right: 5,left: 5),
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
              GlobalWidgets.backArrowButton( backIconFn, isWhite?Colors.white:kText2,Alignment.center),
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

