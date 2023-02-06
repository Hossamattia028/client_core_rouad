
import 'package:client_core/features/presentation/widgets/global_widgets/custom_button.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text_form_field.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';



class ReviewsWidget extends StatelessWidget {
  final int amount;
  final Color color;
  final double size;
  const ReviewsWidget({Key? key,required this.amount,required this.color,required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(amount <= 10){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          Icon(Icons.star,size: size,color: color,),
          Icon(Icons.star_border,size: size,color: Colors.black38,),
          Icon(Icons.star_border,size: size,color: Colors.black38,),
          Icon(Icons.star_border,size: size,color: Colors.black38,),
          Icon(Icons.star_border,size: size,color: Colors.black38,),
        ],
      );
    }else if (amount <= 50 && amount >10){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          Icon(Icons.star,size: size,color: color,),
          Icon(Icons.star,size: size,color: color,),
          Icon(Icons.star_border,size: size,color: Colors.black38,),
          Icon(Icons.star_border,size: size,color: Colors.black38,),
          Icon(Icons.star_border,size: size,color: Colors.black38,),
        ],
      );
    }else if (amount <= 100 && amount > 50){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          Icon(Icons.star,size: size,color: color,),
          Icon(Icons.star,size: size,color: color,),
          Icon(Icons.star,size: size,color: color,),
          Icon(Icons.star_border,size: size,color: Colors.black38,),
          Icon(Icons.star_border,size: size,color: Colors.black38,),
        ],
      );
    }else if (amount <= 150 && amount >100){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          Icon(Icons.star,size: size,color: color,),
          Icon(Icons.star,size: size,color: color,),
          Icon(Icons.star,size: size,color: color,),
          Icon(Icons.star,size: size,color: color,),
          Icon(Icons.star_border,size: size,color: Colors.black38,),
        ],
      );
    }else if (amount <= 200 && amount >150){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          Icon(Icons.star,size: size,color: color,),
          Icon(Icons.star,size: size,color: color,),
          Icon(Icons.star,size: size,color: color,),
          Icon(Icons.star,size: size,color: color,),
          Icon(Icons.star,size: size,color: color,),
        ],
      );
    }
    return const SizedBox.shrink();
  }
}

// class SendReviewWidget extends StatelessWidget {
//   final String advisorID;
//   const SendReviewWidget({Key? key,required this.advisorID}) : super(key: key);
//   static final TextEditingController textEditingController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       height: 200.h,
//       padding: const EdgeInsets.all(10),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           SizedBox(
//             height: 50.h,
//             child: CustomTextFromField(
//                 onChanged: (val){},
//                 hintText: translate("consultation.review_cons"),
//                 labelText: translate("consultation.review_cons"),
//                 radius: 10,
//                 cursorColor: kPrimary,
//                 textEditingController: textEditingController,
//                 validator: () {},
//                 prefixIcon: null,
//                 hasBorder: true,
//                 suffixIcon: const SizedBox(),
//                 obscureText: false,
//                 isLabelError: false),
//           ),
//           const SizedBox(height: 20,),
//           BlocBuilder<ConsultationBloc,ConsultationState>(
//             builder: (ctx,state){
//               var bloc = ConsultationBloc.get(ctx);
//               return RatingBar.builder(
//                 initialRating: 3,
//                 minRating: 1,
//                 direction: Axis.horizontal,
//                 allowHalfRating: true,
//                 itemCount: 5,
//                 itemBuilder: (context, _) => const Icon(
//                   Icons.star,
//                   color: kPrimary,
//                 ),
//                 onRatingUpdate: (rating) {
//                   debugPrint(rating.toString());
//                   bloc.add(UpdateReviewEvent(val: rating));
//                 },
//               );
//             },
//           ),
//           const SizedBox(height: 20,),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               BlocBuilder<ConsultationBloc,ConsultationState>(
//                 builder: (ctx,state){
//                   var bloc = ConsultationBloc.get(ctx);
//                   return CustomButton(
//                       height: 30.h,
//                       width: 100.w,
//                       circular: 5,
//                       widget: CustomText(
//                           text: translate("button.yes"),
//                           color: Colors.white,
//                           fontFamily: primaryFont,
//                           fontSize: AppStyle.small.sp),
//                       color: kPrimary,
//                       onPressed: (){
//                         if(textEditingController.text.trim().isEmpty)return SnackBarBuilder.showFeedBackMessage(context, translate('toast.field_empty'), Colors.red);
//                         bloc.add(SendNewReviewAdvisorEvent(reviewModel:
//                         ReviewModel(
//                             comment: textEditingController.text.trim(),
//                             advisorID: advisorID,
//                             userID: SmallFun.getUserID(),
//                             userName: SmallFun.getName(),
//                             userImg: SmallFun.getImg(),
//                             reviewCount: bloc.currentRating
//                         )));
//                         Navigator.of(context).pop();
//                         SnackBarBuilder.showFeedBackMessage(context, translate('toast.successfully_send'), kPrimary);
//                       });
//                 },
//               ),
//
//               CustomButton(
//                   height: 30.h,
//                   width: 100.w,
//                   circular: 5,
//                   widget: CustomText(
//                       text: translate("button.no"),
//                       color: kDelete,
//                       fontFamily: primaryFont,
//                       fontSize: AppStyle.small.sp),
//                   color: Colors.white,
//                   sideWidth: 1,
//                   sideColor: Colors.black45,
//                   onPressed: ()=>Navigator.of(context).pop()),
//
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

