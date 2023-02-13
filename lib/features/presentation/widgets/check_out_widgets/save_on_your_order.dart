import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_button.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';

class SaveOnYourOrder extends StatelessWidget {
  const SaveOnYourOrder({Key? key}) : super(key: key);
  static TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: translate("cart.save_on_your_order"),
          color: Colors.black,
          fontSize: AppStyle.small.sp,
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(height: 10,),
        CustomTextFromField(
            hintText: translate("cart.enter_voucher_code"),
            labelText: "",
            onChanged: (val){},
            cursorColor: kPrimary,
            hasBorder: true,
            radius: 10,
            textEditingController: textEditingController,
            validator: (){},
            obscureText: false,
            isLabelError: false,
            prefixIcon: const Icon(Icons.local_offer_outlined,size: 20,),
            suffixIcon: CustomButton(
              width: 100.w,
              height: 30.h,
              color: Colors.transparent,
              onPressed: (){},
              widget: CustomText(
                text: translate("button.submit"),
                color: Colors.black,
                fontSize: AppStyle.small.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
        ),

      ],
    );
  }
}
