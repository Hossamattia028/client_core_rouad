import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/styles/constants.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:client_core/features/presentation/widgets/service_widgets/package_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PackagesHList extends StatelessWidget {
  const PackagesHList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
        height: 100.h,
        width: double.infinity,
        child: ListView.separated(
          itemCount: 10,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {},
              child: const PackageCard(),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 10,),
        )
    );
  }
}
