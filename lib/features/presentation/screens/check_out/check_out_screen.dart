import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/check_out_widgets/package_list_check_out.dart';
import 'package:client_core/features/presentation/widgets/check_out_widgets/payment_chooser.dart';
import 'package:client_core/features/presentation/widgets/check_out_widgets/payment_summery.dart';
import 'package:client_core/features/presentation/widgets/check_out_widgets/save_on_your_order.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_button.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 150.h,
            decoration: const BoxDecoration(
              color: kPrimary,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20)
              ),
            ),
            child:  GlobalAppBar(
              title: translate("cart.checkOut"),
              backGroundColor: Colors.grey.shade100,
              textColor:Colors.white,
              height: 75,
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(15),
            margin: EdgeInsets.only(top: 110.h,left: 10,right: 10),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const PackageListCheckOut(),
                  const Divider(),
                  const SizedBox(height: 20,),

                  const SaveOnYourOrder(),
                  const SizedBox(height: 10,),

                  const PaymentKindCheckOut(),
                  const Divider(),
                  const SizedBox(height: 10,),
                  const PaymentSummeryWidget(),
                  const SizedBox(height: 5,),

                  CustomButton(
                    height: 35.h,
                    width: double.infinity,
                    circular: 5,
                    widget: CustomText(
                      text: translate("cart.place_order"),
                      color: Colors.white,
                      fontSize: AppStyle.small.sp+2,
                      fontWeight: FontWeight.w600,
                    ),
                    color: kPrimary,
                    onPressed: (){},
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
