import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/styles/my_fonts.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/deals_widgets/deals_service_list.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';

class DealsScreen extends StatefulWidget {
  const DealsScreen({Key? key}) : super(key: key);

  @override
  State<DealsScreen> createState() => _DealsScreenState();
}

class _DealsScreenState extends State<DealsScreen> with SingleTickerProviderStateMixin{
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(initialIndex: 0,length: 3, vsync: this);
    super.initState();
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: GlobalAppBar(
        title: translate("profile.deals"),
        backGroundColor: Colors.grey.shade100,
        height: 75,
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: AppStyle.paddingFromH.sp),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200.h,
                  decoration: const BoxDecoration(
                      color: kPrimary,
                      borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  height: 40.h,
                  child: TabBar(
                    // onTap: (index){
                    //   tabController.index=index;
                    // },
                    controller: tabController,
                    indicatorColor: kPrimary,
                    indicator: const BoxDecoration(
                        color: kPrimary,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    isScrollable: true,
                    unselectedLabelStyle:const TextStyle(
                      color: kPrimary,
                    ),
                    unselectedLabelColor: kPrimary,
                    tabs: [
                      Text("service name",style: TextStyle(fontSize: AppStyle.small.sp,fontWeight: FontWeight.w400,fontFamily: primaryFont),),
                      Text("service name",style: TextStyle(fontSize: AppStyle.small.sp,fontWeight: FontWeight.w400,fontFamily: primaryFont),),
                      Text("service name",style: TextStyle(fontSize: AppStyle.small.sp,fontWeight: FontWeight.w400,fontFamily: primaryFont),),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(top: 280.h,bottom: 20.h),
              height: 600.h,
              child: TabBarView(
                controller: tabController,
                children:  const [
                  DealsServiceList(),
                  DealsServiceList(),
                  DealsServiceList(),
                ],
              ),
            ),

          ],
        ),
      )
    );
  }
}
