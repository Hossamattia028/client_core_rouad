import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/check_out_widgets/package_card_check_out.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PackageListCheckOut extends StatelessWidget {
  const PackageListCheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 2,
      padding: EdgeInsets.symmetric(horizontal: AppStyle.paddingFromH.w),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: const PackageCheckOutListCard(),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 15,),
    );
  }
}
