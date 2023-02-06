import 'package:client_core/features/presentation/widgets/global_widgets/custom_dialog_widgets.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/review.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/sign_out.dart';
import 'package:flutter/material.dart';

class CustomDialogs {
  static signOut(BuildContext context) async {
    return await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return const Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              backgroundColor: Colors.transparent,
              child: SignOutWidget());
        });
  }




  static passChangedSuccessfully(BuildContext context) async {
    return await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return const Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              backgroundColor: Colors.transparent,
              child: PasswordChangedSuccessfully());
        });
  }

  static reviewConsultation(BuildContext context,String advisorID) async {
    // return await showDialog(
    //     context: context,
    //     barrierDismissible: true,
    //     builder: (BuildContext context) {
    //       return   Dialog(
    //           shape: const RoundedRectangleBorder(
    //             borderRadius: BorderRadius.all(Radius.circular(25)),
    //           ),
    //           backgroundColor: Colors.transparent,
    //           child: SendReviewWidget(advisorID: advisorID));
    //     });
  }


}
