import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/notifications_widgets/notification_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsList extends StatelessWidget {
  const NotificationsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      padding: EdgeInsets.symmetric(horizontal: AppStyle.paddingFromH.sp,vertical: 5.h),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: const NotificationListCard(),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 15,),
    );
  }
}