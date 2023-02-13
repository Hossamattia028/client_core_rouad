import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:client_core/features/presentation/widgets/invoice_widgets/row_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';

class PaymentSummeryWidget extends StatelessWidget {
  const PaymentSummeryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        CustomText(
          text: translate("cart.payment_summery"),
          color: Colors.black,
          fontSize: AppStyle.small.sp,
          fontWeight: FontWeight.w500,
          alignCenter: true,
        ),
        const SizedBox(height: 10,),
        RowDataLine(isSpaceBetween: true, isTextBlack: false,isValueBlack: true, title: translate("cart.service_fee"), value: "0.0 ${translate('home.aed')}"),
        const SizedBox(height: 5,),
        RowDataLine(isSpaceBetween: true, isTextBlack: false,isValueBlack: true, title: translate("cart.delivery_fee"), value: "0.0 ${translate('home.aed')}"),
        const SizedBox(height: 5,),
        RowDataLine(isSpaceBetween: true, isTextBlack: false,isValueBlack: true, title: translate("cart.basket_total"), value: "0.0 ${translate('home.aed')}"),
        const SizedBox(height: 10,),
        RowDataLine(isSpaceBetween: true, isTextBlack: true,isValueBlack: true, title: translate("invoice.total"), value: "0.0 ${translate('home.aed')}"),
        const SizedBox(height: 15,),

      ],
    );
  }
}
