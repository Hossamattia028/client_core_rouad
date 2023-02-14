
// ignore_for_file: must_be_immutable

import 'package:client_core/core/styles/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:client_core/core/util/app_style.dart';


class CustomTextFromField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextEditingController textEditingController;
  final Function validator;
  final bool obscureText;
  Widget? prefixIcon;
  Widget? suffixIcon;
  final bool isLabelError;
  final double radius;
  bool? smallPadding;
  bool? hasBorder;
  Color? cursorColor;
  Color? backGround;
  int? maxLines;
  Function? onChanged;
  VoidCallback? onTap;

  CustomTextFromField({
    required this.hintText,
    required this.labelText,
    required this.textEditingController,
    required this.validator,
    required this.obscureText,
    this.prefixIcon,
    this.suffixIcon,
    required this.isLabelError,
    required this.radius,
    this.smallPadding,
    this.hasBorder,
    this.cursorColor,
    this.backGround,
    this.maxLines,
    required this.onChanged,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      onChanged: (val) => onChanged!(val) ,
      controller: textEditingController,
      maxLines: maxLines??1,
      validator: (value) => validator(value),
      obscureText: obscureText,
      cursorColor: cursorColor ?? Colors.white,
      onTap:  onTap,
      keyboardType: TextInputType.text,
      style: const TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        filled: backGround!=null ? true : false,
        fillColor: backGround ?? Colors.transparent,
        contentPadding: smallPadding==true?
        const EdgeInsets.symmetric(vertical: 4,horizontal: 1):null,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder:  OutlineInputBorder(
          borderSide: hasBorder==true? const  BorderSide(color: kPrimary, width: 1.0): const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:  hasBorder==true? const  BorderSide(color: kText2, width: 1.0): const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: AppStyle.small.sp,
          color: Colors.black54,
          fontWeight: FontWeight.w400,
        ),
        label: Text(
          labelText,
          style: TextStyle(
            color: isLabelError ? Colors.red : kPrimary,
            fontSize: AppStyle.small.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        errorStyle: const TextStyle(
          color: Colors.red,
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
