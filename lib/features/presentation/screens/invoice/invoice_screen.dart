import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_button.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:client_core/features/presentation/widgets/invoice_widgets/row_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150.h,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: kPrimary,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
              ),
              child: CustomText(
                text: "Simple Design",
                fontSize: AppStyle.average.sp,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                alignCenter: true,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: AppStyle.paddingFromH.w+5,vertical: AppStyle.paddingFromV.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5,),
                  CustomText(
                    text: "Hi This applicant's name",
                    fontSize: AppStyle.average.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 5,),
                  CustomText(
                    text: "Thank you for ordering with us .",
                    fontSize: AppStyle.small.sp,
                    color: kText1,
                    fontWeight: FontWeight.w400,
                  ),
                  CustomText(
                    text: "Below are your order details .",
                    fontSize: AppStyle.small.sp,
                    color: kText1,
                    fontWeight: FontWeight.w400,
                  ),
                  const SizedBox(height: 20,),

                  RowDataLine(isSpaceBetween: false, isTextBlack: true,isValueBlack: false, title: "${translate("invoice.order_id")} :", value: "4334343443"),
                  const SizedBox(height: 5,),
                  RowDataLine(isSpaceBetween: false, isTextBlack: true,isValueBlack: false, title: "${translate("invoice.date")} :", value: "Sun,December 3,2023"),
                  const SizedBox(height: 5,),
                  RowDataLine(isSpaceBetween: false, isTextBlack: true,isValueBlack: false, title: "${translate("invoice.address")} :", value: "Dubai-United Arab Emirates"),
                  const SizedBox(height: 5,),

                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.grey.shade600,
              padding: EdgeInsets.symmetric(horizontal: AppStyle.paddingFromH.w+5,vertical: 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Package name",
                    fontSize: AppStyle.small.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomText(
                    text: "0.0 ${translate('home.aed')}",
                    fontSize: AppStyle.small.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: AppStyle.paddingFromH.w+5,vertical: AppStyle.paddingFromV.h),
              child: Column(
                children:  [
                   RowDataLine(isSpaceBetween: true, isTextBlack: true,isValueBlack: false, title: "Tax Invoice", value: "1 vehicle"),
                   const Divider(),
                   RowDataLine(isSpaceBetween: true, isTextBlack: false,isValueBlack: false, title: "Package name", value: "details"),
                   const Divider(),
                   RowDataLine(isSpaceBetween: true, isTextBlack: false,isValueBlack: false, title: "Package name", value: "details"),
                   const Divider(),
                   RowDataLine(isSpaceBetween: true, isTextBlack: false,isValueBlack: false, title: translate("invoice.discount"), value: "0.0 ${translate('home.aed')}"),
                   const Divider(),
                   RowDataLine(isSpaceBetween: true, isTextBlack: false,isValueBlack: false, title: "${translate("invoice.vat")} 5%", value: "0.0 ${translate('home.aed')}"),
                   const Divider(),
                   RowDataLine(isSpaceBetween: true, isTextBlack: true,isValueBlack: true, title: translate("invoice.total"), value: "0.0 ${translate('home.aed')}"),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            CustomButton(
              height: 40.h,
              width: double.infinity,
              circular: 0,
              widget: CustomText(
                color: Colors.white,
                fontSize: AppStyle.small.sp,
                fontWeight: FontWeight.w600,
                text: translate("invoice.thank_for_order"),
              ),
              color: kPrimary,
              onPressed: () async {

              },
            ),

          ],
        ),
      ),
    );
  }
}


