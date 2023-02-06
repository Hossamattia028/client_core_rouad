import 'dart:async';
import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/align_child_by_row.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/global_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeVerificationScreen extends StatefulWidget {
  final String email;
  const PinCodeVerificationScreen({Key? key, required this.email})
      : super(key: key);

  @override
  State<PinCodeVerificationScreen> createState() =>
      _PinCodeVerificationScreenState();
}

class _PinCodeVerificationScreenState extends State<PinCodeVerificationScreen> {
  var onTapRecognizer = TapGestureRecognizer();

  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;

  // late AuthBloc authBloc;
  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // authBloc = AuthBloc.get(context);
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimary,
        key: scaffoldKey,
        body: Container(
            child: Column(
          children: [
            GlobalAppBarLogo(
              isWhite: true,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              backIconFn: () => Navigator.of(context).pop(),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                margin: EdgeInsets.only(top: 100.h),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Text(
                        translate("signup.confirm_phone"),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      RichText(
                        text: TextSpan(
                            text: "${translate("signup.code_sent")} \n\n",
                            children: [
                              TextSpan(
                                  text: widget.email,
                                  style: TextStyle(
                                      color: kPrimary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: AppStyle.average.sp)),
                            ],
                            style: TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.w500,
                                fontSize: AppStyle.average.sp - 3)),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Form(
                        key: formKey,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 10),
                            child: PinCodeTextField(
                              appContext: context,
                              pastedTextStyle: TextStyle(
                                color: Colors.green.shade600,
                                fontWeight: FontWeight.bold,
                              ),
                              length: 6,
                              obscureText: false,
                              obscuringCharacter: '*',
                              animationType: AnimationType.fade,
                              validator: (v) {
                                if (v!.length < 3) {
                                  return "I'm from validator";
                                } else {
                                  return null;
                                }
                              },
                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(5),
                                fieldHeight: 60,
                                fieldWidth: 50,
                                activeColor: kPrimary,
                                activeFillColor: Colors.white,
                                inactiveColor: Colors.white,
                                inactiveFillColor: Colors.white,
                                selectedFillColor: kPrimary,
                                disabledColor: Colors.white,
                              ),
                              cursorColor: Colors.black,
                              animationDuration:
                                  const Duration(milliseconds: 300),
                              textStyle:
                                  const TextStyle(fontSize: 20, height: 1.6),
                              backgroundColor: Colors.white,
                              enableActiveFill: true,
                              errorAnimationController: errorController,
                              controller: textEditingController,
                              keyboardType: TextInputType.number,
                              boxShadows: const [
                                BoxShadow(
                                  offset: Offset(0, 1),
                                  color: Colors.black12,
                                  blurRadius: 10,
                                )
                              ],
                              onCompleted: (v) {
                                debugPrint("Completed");
                              },
                              // onTap: () {
                              //   debugPrint("Pressed");
                              // },
                              onChanged: (value) {
                                debugPrint(value);
                                setState(() {
                                  currentText = value;
                                });
                              },
                              beforeTextPaste: (text) {
                                debugPrint("Allowing to paste $text");
                                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                return true;
                              },
                            )),
                      ),
                      Text(
                        hasError ? translate("signup.fill_all") : "",
                        style: const TextStyle(
                            color: kPrimary,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),

                      const SizedBox(
                        height: 14,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 30),
                        decoration: BoxDecoration(
                            color: kPrimary,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  color: kPrimary.withOpacity(0.2),
                                  offset: const Offset(1, -2),
                                  blurRadius: 5),
                              BoxShadow(
                                  color: kPrimary.withOpacity(0.2),
                                  offset: const Offset(-1, 2),
                                  blurRadius: 5)
                            ]),
                        child: ButtonTheme(
                          height: 50,
                          child: TextButton(
                            onPressed: () {
                              // formKey.currentState!.validate();
                              // // conditions for validating
                              // if (currentText.length != 6 || currentText != "towtow") {
                              //   errorController!.add(ErrorAnimationType
                              //       .shake); // Triggering error shake animation
                              //   setState(() {
                              //     hasError = true;
                              //   });
                              // } else {
                              //   setState(() {
                              //     hasError = false;
                              //     SnackBarBuilder.showFeedBackMessage(context, "Aye!!", Colors.green);
                              //   });
                              // }
                              // if(textEditingController.text.trim().isEmpty) {
                              //    SnackBarBuilder.showFeedBackMessage(context, translate("toast.field_empty"), Colors.red);
                              //    return;
                              // }
                              // if(authBloc.verifyChangeEmailCode(textEditingController.text.trim())) {
                              //   SmallFun.pushPage(PasswordConfirmed(isChangePassState: true,email: widget.email.toString().trim(),), context);
                              // }else{
                              //   SnackBarBuilder.showFeedBackMessage(context, translate("toast.error_data"), Colors.red);
                              // }
                            },
                            child: Center(
                                child: Text(
                              translate("signup.very").toUpperCase(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            )),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: translate("signup.not_get_code"),
                            style: const TextStyle(
                                color: Colors.black54, fontSize: 15),
                            children: [
                              TextSpan(
                                  text: " ${translate("signup.resend")}",
                                  recognizer: onTapRecognizer,
                                  style: TextStyle(
                                      color: kPrimary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: AppStyle.small.sp))
                            ]),
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: <Widget>[
                      //     TextButton(
                      //       child: const Text("Clear"),
                      //       onPressed: () {
                      //         textEditingController.clear();
                      //       },
                      //     ),
                      //     TextButton(
                      //       child: const Text("Set Text"),
                      //       onPressed: () {
                      //         textEditingController.text = "123456";
                      //       },
                      //     ),
                      //   ],
                      // )
                    ],
                  ),
                ),
              ),
            ),
          ],
        )));
  }
}
