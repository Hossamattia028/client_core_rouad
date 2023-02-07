import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/account_widgets/item_line.dart';
import 'package:client_core/features/presentation/widgets/account_widgets/profile_view_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kText1,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: AppStyle.paddingFromV.h+20,horizontal: AppStyle.paddingFromH.w),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children:  [
            const ProfileCardView(),
            const SizedBox(height: 20,),
            ItemLineWidget(iconData: Icons.drive_eta_sharp, title: translate("profile.my_details"), fn: (){},borderRadius: const BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),),
            const SizedBox(height: 2,),
            ItemLineWidget(iconData: Icons.description_outlined, title: translate("profile.orders"), fn: (){}),
            const SizedBox(height: 2,),
            ItemLineWidget(iconData: Icons.favorite_border, title: translate("profile.wishlist"), fn: (){}),
            const SizedBox(height: 2,),
            ItemLineWidget(iconData: Icons.location_on, title: translate("profile.locations"), fn: (){},borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))),
            const SizedBox(height: 8,),
            ItemLineWidget(iconData: Icons.wallet, title: translate("profile.wallet"), fn: (){},borderRadius: const BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15))),
            const SizedBox(height: 2,),
            ItemLineWidget(iconData: Icons.local_offer_outlined, title: translate("profile.deals"), fn: (){}),
            const SizedBox(height: 2,),
            ItemLineWidget(iconData: Icons.notifications_none, title: translate("profile.notification"), fn: (){},borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))),
            const SizedBox(height: 8,),
            ItemLineWidget(iconData: Icons.call, title: translate("activity_setting.contact_us"), fn: (){},borderRadius: const BorderRadius.all(Radius.circular(15)),),
            const SizedBox(height: 8,),
            ItemLineWidget(iconData: Icons.logout, title: translate("profile.sign_out"), fn: (){},borderRadius: const BorderRadius.all(Radius.circular(15)),),
          ],
        ),
      ),
    );
  }
}
