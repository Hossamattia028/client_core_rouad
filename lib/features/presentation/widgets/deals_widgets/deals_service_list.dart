import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/deals_widgets/deal_service_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DealsServiceList extends StatelessWidget {
  const DealsServiceList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: const DealServiceCard(),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10,),
    );
  }
}
