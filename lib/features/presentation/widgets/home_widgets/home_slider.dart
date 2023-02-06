import 'package:carousel_slider/carousel_slider.dart';
import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/styles/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5,),
        SizedBox(
          height: 200.h,
          width: double.infinity,
          child:  CarouselSlider.builder(
            itemCount: 5,
            options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 1,
              enlargeCenterPage: false,
              // onPageChanged: (index,reason)=> bloc.add(ChangeSliderIndexEvent(val: index)),
            ),
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: NetworkImage(Constants.img),
                    fit: BoxFit.fill
                  )
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for(int i = 0 ; i<5; i++)...[
              Padding(
                padding: const EdgeInsets.only(bottom: 10,left: 10),
                child: Icon(Icons.circle,color: i==2?Colors.black:Colors.black12,size: 11.w,),
              ),
            ],
          ],
        ),




      ],
    );
  }
}
