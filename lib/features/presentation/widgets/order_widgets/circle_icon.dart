import 'package:client_core/core/styles/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleIconWidget extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onTap;
  const CircleIconWidget({Key? key,required this.iconData,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: ()=> onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
            color: kText1,
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Icon(iconData,color: Colors.white,size: 18.w,),
      ),
    );
  }
}
