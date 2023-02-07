import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/order_widgets/order_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderList extends StatelessWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      padding: EdgeInsets.symmetric(horizontal: AppStyle.paddingFromH.sp+10,vertical: 5.h),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: const OrderListCard(),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 25,),
    );
  }
}
