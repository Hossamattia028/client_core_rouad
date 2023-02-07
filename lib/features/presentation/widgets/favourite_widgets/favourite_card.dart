import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/styles/constants.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';

class FavouriteCard extends StatelessWidget {
  const FavouriteCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 6.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  height: 80.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          image: NetworkImage(Constants.img),
                          fit: BoxFit.fill
                      )
                  ),
                ),
                const SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Service name",
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: AppStyle.verySmall.sp,
                    ),
                    const SizedBox(height: 10,),
                    SizedBox(
                      width: 100.w,
                      child: CustomText(
                        text: "service description",
                        color: kText1,
                        fontSize: AppStyle.verySmall.sp,
                        fontWeight: FontWeight.w400,
                        ellipsis: true,
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined,color: Colors.red,size: 12.w,),
                        const Text("Location",style: TextStyle(color: kText1),)
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 5,),
              ],
            ),
          ),
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.favorite,color: Colors.red,),
          ),


        ],
      ),
    );
  }
}
