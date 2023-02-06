import 'package:client_core/main.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_button.dart';
import 'package:flutter_translate/flutter_translate.dart';

class SignOutWidget extends StatelessWidget {
  const SignOutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox();
    // return  BlocListener<AuthBloc,AuthState>(
    //   listener: (ctx,state){
    //     if(state is LogOutState)SmallFun.pushPageAndRemoveRoutes(const MyApp(), ctx);
    //   },
    //   listenWhen: (ctx,state){
    //     return state is LogOutState;
    //   },
    //   child: BlocBuilder<AuthBloc,AuthState>(
    //     builder: (cxt,state){
    //       var bloc = AuthBloc.get(cxt);
    //       return Container(
    //         height: 220.h,
    //         width: 400.w,
    //         decoration: BoxDecoration(
    //             color: Colors.white,
    //             borderRadius: BorderRadius.circular(15)
    //         ),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //           children: [
    //             Image.asset(AppImages.logOut,height: 45.h,fit: BoxFit.cover,),
    //             CustomText(
    //                 text: translate("activity_setting.sure_signout"),
    //                 color: kText2,
    //                 fontFamily: primaryFont,
    //                 fontSize: AppStyle.small.sp),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //               children: [
    //                 CustomButton(
    //                     height: 30.h,
    //                     width: 100.w,
    //                     circular: 5,
    //                     widget: CustomText(
    //                         text: translate("button.yes"),
    //                         color: Colors.white,
    //                         fontFamily: primaryFont,
    //                         fontSize: AppStyle.small.sp),
    //                     color: kDelete,
    //                     onPressed: ()=> bloc.add(LogOutEvent())),
    //                 CustomButton(
    //                     height: 30.h,
    //                     width: 100.w,
    //                     circular: 5,
    //                     widget: CustomText(
    //                         text: translate("button.no"),
    //                         color: kDelete,
    //                         fontFamily: primaryFont,
    //                         fontSize: AppStyle.small.sp),
    //                     color: Colors.white,
    //                     sideWidth: 1,
    //                     sideColor: Colors.black45,
    //                     onPressed: ()=>Navigator.of(context).pop()),
    //
    //               ],
    //             ),
    //           ],
    //         ),
    //       );
    //     },
    //   )
    // );
  }
}
