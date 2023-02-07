
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/favourite_widgets/favourite_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteList extends StatelessWidget {
  const FavouriteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      padding: EdgeInsets.symmetric(horizontal: AppStyle.paddingFromH.sp),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: const FavouriteCard(),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 15,),
    );
  }
}
