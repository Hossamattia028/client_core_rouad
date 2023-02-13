import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';

class PaymentTermsConditions extends StatelessWidget {
  const PaymentTermsConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: true,
            onChanged: (val){},
            checkColor: Colors.white,
            fillColor: MaterialStateColor.resolveWith((states) => kText1),
        ),
        const SizedBox(width: 10,),
        CustomText(
          text: translate("cart.have_read_payment_terms"),
          color: Colors.black,
          fontSize: AppStyle.small.sp,
        ),
      ],
    );
  }
}
