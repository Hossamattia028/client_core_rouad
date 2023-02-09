import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/global_widgets.dart';
import 'package:client_core/features/presentation/widgets/wallet_widgets/small_circle_main_card.dart';
import 'package:client_core/features/presentation/widgets/wallet_widgets/transactions_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: GlobalAppBar(
        title: translate("profile.wallet"),
        backGroundColor: Colors.grey.shade100,
        height: 75,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: AppStyle.paddingFromH.sp,vertical: AppStyle.paddingFromV.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200.h,
              padding: const EdgeInsets.all(30),
              decoration: const BoxDecoration(
                  color: kPrimary,
                  borderRadius: BorderRadius.all(Radius.circular(15))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                      text: "0.00 ${translate("home.aed")}",
                      color: Colors.white,
                      fontSize: AppStyle.average.sp,
                      fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SmallCircleCard(title: translate("wallet.top_up"), iconData: Icons.arrow_upward),
                      SmallCircleCard(title: translate("wallet.manage"), iconData: Icons.account_balance_wallet_outlined),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20,),

            const TransactionsList(),

          ],
        ),
      ),
    );
  }
}
