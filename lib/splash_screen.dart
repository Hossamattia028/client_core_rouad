import 'dart:async';
import 'package:client_core/core/strings/app_images.dart';
import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/util/small_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 40.h),
        decoration: const BoxDecoration(
          color: kPrimary
          // image: DecorationImage(
          //   image: AssetImage(AppImages.splashImg),
          //   fit: BoxFit.fill
          // )
        ),
        // child: Image.asset(
        //   AppImages.logoO,
        //   fit: BoxFit.contain,
        //   width: 240.w,
        //   height: 250.h,
        // ),
        child: const Text("Flutter Logo",style: TextStyle(color: Colors.white,fontSize: 20),),
      )
    );
  }

  _checkFunctionFromApi(){
    if(Util.checkUser()){

    }
  }
}
