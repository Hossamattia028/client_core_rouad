// import 'package:client_core/features/global_widgets/custom_text.dart';
// import 'package:client_core/features/global_widgets/global_widgets.dart';
// import 'package:client_core/core/util/app_style.dart';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_translate/flutter_translate.dart';
//
// class ChangeLanguage extends StatelessWidget {
//   const ChangeLanguage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kRootBackGround,
//       body: SizedBox(
//         height: double.infinity,
//         child: Column(
//           children: [
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Column(
//                 children: [
//                   const SizedBox(height: 35,),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Row(
//                         children: [
//                           GlobalWidgets.backArrowButton(()=> Navigator.of(context).pop(), Colors.white,Alignment.center),
//                           CustomText(
//                               text: translate("button.change_language"),
//                               color: Colors.white,
//                               fontFamily: primaryFont,
//                               fontWeight: FontWeight.w500,
//                               fontSize: AppStyle.small.sp),
//                         ],
//                       ),
//                       const ChatPersonIcon()
//                     ],
//                   ),
//                   const SizedBox(height: 15,),
//
//                 ],
//               ),
//             ),
//             Expanded(
//               child: Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
//                   alignment: Alignment.topCenter,
//                   decoration: const BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(25),
//                           topRight: Radius.circular(25))),
//                   child: SingleChildScrollView(
//                     physics: const BouncingScrollPhysics(),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: const [
//                          LanguageCard(title: "العربية",img: AppImages.arabic,isActive: true,),
//                          LanguageCard(title: "English",img: AppImages.english,isActive: false,),
//                       ],
//                     ),
//                   )
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class LanguageCard extends StatelessWidget {
//   final bool isActive;
//   final String title;
//   final String img;
//   const LanguageCard({Key? key,required this.isActive,required this.title,required this.img}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       child: Directionality(
//         textDirection: img==AppImages.arabic?TextDirection.rtl:TextDirection.ltr,
//         child: Container(
//             width: 400.w,
//             margin: const EdgeInsets.only(bottom: 20),
//             padding: const EdgeInsets.all(13),
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 border: Border.all(width: 1,color: isActive==true?kPrimary:kText2),
//                 borderRadius: BorderRadius.circular(15)
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Image.asset(img),
//                     const SizedBox(width: 10,),
//                     CustomText(
//                       text: title,
//                       fontSize: AppStyle.small.sp,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.black,
//                     ),
//                   ],
//                 ),
//                 if(isActive)const Icon(Icons.check_circle,color: kPrimary,)
//
//               ],
//             )
//         ),
//       )
//     );
//   }
// }
