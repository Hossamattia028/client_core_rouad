import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:client_core/features/presentation/widgets/order_widgets/order_list_card.dart';
import 'package:client_core/features/presentation/widgets/wallet_widgets/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';

class TransactionsList extends StatelessWidget {
  const TransactionsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 240.w,child: CustomText(text: translate("wallet.transactions_empty"), color: kPrimary, fontSize: AppStyle.small.sp,alignCenter: true,));
    // return ListView.separated(
    //   itemCount: 10,
    //   physics: const BouncingScrollPhysics(),
    //   shrinkWrap: true,
    //   scrollDirection: Axis.vertical,
    //   itemBuilder: (context, index) {
        // return GestureDetector(
        //   onTap: () {},
        //   child: const TransactionCard(),
        // );
    //   },
    //   separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 25,),
    // );
  }
}
