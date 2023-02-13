import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/check_out_widgets/have_read_payment_terms.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';

class PaymentKindCheckOut extends StatelessWidget {
  const PaymentKindCheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: kText1,
                  borderRadius: BorderRadius.all(Radius.circular(50))
              ),
              child: Icon(Icons.done,color: Colors.white,size: 17.w,),
            ),
            const SizedBox(width: 10,),
            CustomText(
              text: translate("cart.online_payment"),
              color: Colors.black,
              fontSize: AppStyle.small.sp,
            ),
          ],
        ),
        const SizedBox(height: 10,),
        const PaymentTermsConditions(),
        const SizedBox(height: 10,),
        Row(
          children: [
            Container(
              decoration:  BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  border: Border.all(width: 1,color: kText1)
              ),
              child: Icon(Icons.done,color: Colors.white,size: 16.w,),
            ),
            const SizedBox(width: 10,),
            CustomText(
              text: translate("cart.cash_on_delivery"),
              color: Colors.black,
              fontSize: AppStyle.small.sp,
            ),
          ],
        ),
      ],
    );
  }
}
