
import 'package:client_core/core/styles/color.dart';
import 'package:client_core/core/styles/my_fonts.dart';
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/core/util/snackbars_builder.dart';
import 'package:client_core/features/domain/entities/fetch_states.dart';
import 'package:client_core/features/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:client_core/features/presentation/blocs/auth_bloc/auth_event.dart';
import 'package:client_core/features/presentation/blocs/auth_bloc/auth_state.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/align_child_by_row.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text_form_field.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/global_widgets.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';



class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static final TextEditingController phoneTextEditingController = TextEditingController();
  static final TextEditingController passTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimary,
        body: Container(
          decoration: const BoxDecoration(),
          height: double.infinity,
          child: Column(
            children: [
              GlobalAppBarLogo(isWhite: true,padding: const EdgeInsets.symmetric(horizontal: 20),backIconFn: ()=>Navigator.of(context).pop(),),
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
                    margin: EdgeInsets.only(top: 200.h),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          AlignChildRow(
                            isStart: true,
                            child: CustomText(
                                text: translate("login.login").toUpperCase(),
                                color: kPrimary,
                                fontWeight: FontWeight.w500,
                                fontFamily: primaryFont,
                                fontSize: AppStyle.large.sp),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 86.w,
                                child: CountryListPick(
                                    appBar: AppBar(
                                      backgroundColor: kPrimary,
                                      title: CustomText(
                                        text: translate("profile.select_country"),
                                        color: Colors.white,
                                        fontSize: AppStyle.small.sp,
                                      ),
                                    ),
                                    pickerBuilder: (context,
                                        CountryCode? countryCode) {
                                      return Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            countryCode!.flagUri!,
                                            package: 'country_list_pick',
                                            width: 17.w,
                                            height: 17.h,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            countryCode.dialCode!,
                                            style:  TextStyle(
                                                color: Colors.black,fontSize: AppStyle.verySmall.sp),
                                          ),
                                          const SizedBox(width: 4),
                                          const Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.black,
                                          )
                                        ],
                                      );
                                    },
                                    theme: CountryTheme(
                                      isShowFlag: true,
                                      isShowCode: true,
                                      isDownIcon: true,
                                    ),
                                    initialSelection: "+971",
                                    onChanged: (CountryCode? code) {

                                    },
                                    useUiOverlay: true,
                                    useSafeArea: false),
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: 50.h,
                                  child: CustomTextFromField(
                                      onChanged: (val){},
                                      hintText: translate("signup.phone"),
                                      labelText: translate("signup.phone"),
                                      radius: 10,
                                      cursorColor: kPrimary,
                                      textEditingController:
                                      phoneTextEditingController,
                                      validator: () {},
                                      prefixIcon: null,
                                      hasBorder: true,
                                      suffixIcon: const SizedBox(),
                                      obscureText: false,
                                      isLabelError: false),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 50.h,
                            child: CustomTextFromField(
                                onChanged: (val){},
                                hintText: translate("login.password"),
                                labelText: translate("login.password"),
                                radius: 10,
                                textEditingController: passTextEditingController,
                                cursorColor: kPrimary,
                                validator: () {},
                                prefixIcon: null,
                                obscureText: true,
                                hasBorder: true,
                                // suffixIcon: IconButton(
                                //   onPressed: () => ctx.read<AuthBloc>().add(const ChangePasswordEvent()),
                                //   icon: Icon(
                                //     showPassword==true
                                //         ? CupertinoIcons.eye
                                //         : CupertinoIcons.eye_slash,
                                //     color: kPrimary,
                                //   ),
                                // ),
                                // obscureText: authProvider.isSecurePassword,
                                isLabelError: false),
                          ),
                          // BlocBuilder<AuthBloc,AuthState>(
                          //   builder: (ctx,state){
                          //     bool showPassword = AuthBloc.get(context).showPassword;
                          //     return SizedBox(
                          //       height: 50.h,
                          //       child: CustomTextFromField(
                          //           onChanged: (val){},
                          //           hintText: translate("login.password"),
                          //           labelText: translate("login.password"),
                          //           radius: 10,
                          //           textEditingController: passTextEditingController,
                          //           cursorColor: kPrimary,
                          //           validator: () {},
                          //           prefixIcon: null,
                          //           obscureText: !showPassword,
                          //           hasBorder: true,
                          //           suffixIcon: IconButton(
                          //             onPressed: () => ctx.read<AuthBloc>().add(const ChangePasswordEvent()),
                          //             icon: Icon(
                          //               showPassword==true
                          //                   ? CupertinoIcons.eye
                          //                   : CupertinoIcons.eye_slash,
                          //               color: kPrimary,
                          //             ),
                          //           ),
                          //           // obscureText: authProvider.isSecurePassword,
                          //           isLabelError: false),
                          //     );
                          //   },
                          // ),
                          const SizedBox(
                            height: 10,
                          ),
                          AlignChildRow(
                              isStart: false,
                              child: GestureDetector(
                                // onTap: ()=> SmallFun.pushPage(const SendVerifyEmailScreen(), context),
                                child: CustomText(
                                    text: translate("login.forget_pass"),
                                    color: Colors.black,
                                    fontSize: AppStyle.verySmall.sp),
                              )
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          MaterialButton(
                            onPressed: () async {
                              if(phoneTextEditingController.text.trim().isNotEmpty && passTextEditingController.text.trim().isNotEmpty){
                                AuthBloc.get(context).add(LogInEvent(email: phoneTextEditingController.text.trim(),password: passTextEditingController.text.trim()));
                              }else{
                                return SnackBarBuilder.showFeedBackMessage(context, translate("toast.field_empty"), Colors.red);
                              }
                            },
                            minWidth: double.infinity,
                            color: kPrimary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(width: 2, color: kPrimary),
                            ),
                            child: InkWell(
                              splashColor: kPrimary,
                              hoverColor: kPrimary,
                              focusColor: kPrimary,
                              highlightColor: kPrimary,
                              child: CustomText(
                                text: translate("login.login").toUpperCase(),
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.w,
                              ),
                            ),
                          ),
                          // BlocBuilder<AuthBloc,AuthState>(
                          //     builder: (ctx,state){
                          //       FetchStates state = AuthBloc.get(ctx).currentState;
                          //       if(state==FetchStates.LOADING)return const Center(child: CircularProgressIndicator(color: kPrimary,),);
                          //       return MaterialButton(
                          //         onPressed: () async {
                          //           if(emailTextEditingController.text.trim().isNotEmpty && passTextEditingController.text.trim().isNotEmpty){
                          //             AuthBloc.get(context).add(LogInEvent(email: emailTextEditingController.text.trim(),password: passTextEditingController.text.trim()));
                          //           }else{
                          //             return SnackBarBuilder.showFeedBackMessage(context, translate("toast.field_empty"), Colors.red);
                          //           }
                          //         },
                          //         minWidth: double.infinity,
                          //         color: kPrimary,
                          //         shape: RoundedRectangleBorder(
                          //           borderRadius: BorderRadius.circular(10),
                          //           side: const BorderSide(width: 2, color: kPrimary),
                          //         ),
                          //         child: InkWell(
                          //           splashColor: kPrimary,
                          //           hoverColor: kPrimary,
                          //           focusColor: kPrimary,
                          //           highlightColor: kPrimary,
                          //           child: CustomText(
                          //             text: translate("login.login"),
                          //             color: Colors.white,
                          //             fontWeight: FontWeight.w500,
                          //             fontSize: 16.w,
                          //           ),
                          //         ),
                          //       );
                          //     }
                          // ),

                          const SizedBox(
                            height: 20,
                          ),
                          AlignChildRow(
                            isStart: true,
                            child: Text.rich(
                              TextSpan(
                                text:
                                "${translate("login.dont_have_anaccount")} ",
                                children: [
                                  TextSpan(
                                    text: translate("signup.signup"),
                                    style: TextStyle(
                                      color: kPrimary,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {


                                      },
                                  )
                                ],
                                style: const TextStyle(
                                  color: Colors.black38,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomText(text: "Skip >", color: Colors.black, fontSize: AppStyle.small.sp)
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
        // body: BlocListener<AuthBloc,AuthState>(
        //   listener: (ctx,state){
        //     if(state is LogInSuccessfullyState){
        //       // if(state.response.state == FetchStates.SUCCESSFULLY)SmallFun.pushPageAndRemoveRoutes(const MyApp(), ctx);
        //       if(state.response.state == FetchStates.FAILED)SnackBarBuilder.showFeedBackMessage(context, state.response.msg.toString(), Colors.red);
        //     }
        //   },
        //   listenWhen: (ctx,state){
        //     return state is LogInSuccessfullyState;
        //   },
        //   child: Container(
        //     decoration: const BoxDecoration(),
        //     height: double.infinity,
        //     child: Column(
        //       children: [
        //         GlobalAppBarLogo(isWhite: true,padding: const EdgeInsets.symmetric(horizontal: 20),backIconFn: ()=>Navigator.of(context).pop(),),
        //         Expanded(
        //           child: Container(
        //               padding: const EdgeInsets.symmetric(
        //                   horizontal: 30, vertical: 10),
        //               decoration: const BoxDecoration(
        //                   color: Colors.white,
        //                   borderRadius: BorderRadius.only(
        //                       topRight: Radius.circular(20),
        //                       topLeft: Radius.circular(20))),
        //               child: SingleChildScrollView(
        //                 child: Column(
        //                   crossAxisAlignment: CrossAxisAlignment.center,
        //                   mainAxisAlignment: MainAxisAlignment.start,
        //                   children: [
        //                     const SizedBox(
        //                       height: 30,
        //                     ),
        //                     AlignChildRow(
        //                       isStart: true,
        //                       child: CustomText(
        //                           text: translate("login.login"),
        //                           color: kPrimary,
        //                           fontWeight: FontWeight.w500,
        //                           fontFamily: primaryFont,
        //                           fontSize: AppStyle.large.sp),
        //                     ),
        //                     const SizedBox(
        //                       height: 20,
        //                     ),
        //                     SizedBox(
        //                       height: 50.h,
        //                       child: CustomTextFromField(
        //                           onChanged: (val){},
        //                           hintText: translate("login.email"),
        //                           labelText: translate("login.email"),
        //                           radius: 10,
        //                           cursorColor: kPrimary,
        //                           textEditingController:
        //                           emailTextEditingController,
        //                           validator: () {},
        //                           prefixIcon: null,
        //                           hasBorder: true,
        //                           suffixIcon: const SizedBox(),
        //                           obscureText: false,
        //                           isLabelError: false),
        //                     ),
        //                     const SizedBox(
        //                       height: 20,
        //                     ),
        //                     BlocBuilder<AuthBloc,AuthState>(
        //                       builder: (ctx,state){
        //                         bool showPassword = AuthBloc.get(context).showPassword;
        //                         return SizedBox(
        //                           height: 50.h,
        //                           child: CustomTextFromField(
        //                               onChanged: (val){},
        //                               hintText: translate("login.password"),
        //                               labelText: translate("login.password"),
        //                               radius: 10,
        //                               textEditingController: passTextEditingController,
        //                               cursorColor: kPrimary,
        //                               validator: () {},
        //                               prefixIcon: null,
        //                               obscureText: !showPassword,
        //                               hasBorder: true,
        //                               suffixIcon: IconButton(
        //                                 onPressed: () => ctx.read<AuthBloc>().add(const ChangePasswordEvent()),
        //                                 icon: Icon(
        //                                   showPassword==true
        //                                       ? CupertinoIcons.eye
        //                                       : CupertinoIcons.eye_slash,
        //                                   color: kPrimary,
        //                                 ),
        //                               ),
        //                               // obscureText: authProvider.isSecurePassword,
        //                               isLabelError: false),
        //                         );
        //                       },
        //                     ),
        //                     const SizedBox(
        //                       height: 10,
        //                     ),
        //                     AlignChildRow(
        //                       isStart: false,
        //                       child: GestureDetector(
        //                         // onTap: ()=> SmallFun.pushPage(const SendVerifyEmailScreen(), context),
        //                         child: CustomText(
        //                             text: translate("login.forget_pass"),
        //                             color: Colors.black,
        //                             fontSize: AppStyle.verySmall.sp),
        //                       )
        //                     ),
        //                     const SizedBox(
        //                       height: 30,
        //                     ),
        //                     BlocBuilder<AuthBloc,AuthState>(
        //                         builder: (ctx,state){
        //                           FetchStates state = AuthBloc.get(ctx).currentState;
        //                           if(state==FetchStates.LOADING)return const Center(child: CircularProgressIndicator(color: kPrimary,),);
        //                           return MaterialButton(
        //                             onPressed: () async {
        //                               if(emailTextEditingController.text.trim().isNotEmpty && passTextEditingController.text.trim().isNotEmpty){
        //                                 AuthBloc.get(context).add(LogInEvent(email: emailTextEditingController.text.trim(),password: passTextEditingController.text.trim()));
        //                               }else{
        //                                 return SnackBarBuilder.showFeedBackMessage(context, translate("toast.field_empty"), Colors.red);
        //                               }
        //                             },
        //                             minWidth: double.infinity,
        //                             color: kPrimary,
        //                             shape: RoundedRectangleBorder(
        //                               borderRadius: BorderRadius.circular(10),
        //                               side: const BorderSide(width: 2, color: kPrimary),
        //                             ),
        //                             child: InkWell(
        //                               splashColor: kPrimary,
        //                               hoverColor: kPrimary,
        //                               focusColor: kPrimary,
        //                               highlightColor: kPrimary,
        //                               child: CustomText(
        //                                 text: translate("login.login"),
        //                                 color: Colors.white,
        //                                 fontWeight: FontWeight.w500,
        //                                 fontSize: 16.w,
        //                               ),
        //                             ),
        //                           );
        //                         }
        //                     ),
        //
        //                     const SizedBox(
        //                       height: 25,
        //                     ),
        //                     AlignChildRow(
        //                       isStart: true,
        //                       child: Text.rich(
        //                         TextSpan(
        //                           text:
        //                           "${translate("login.dont_have_anaccount")} ",
        //                           children: [
        //                             TextSpan(
        //                               text: translate("signup.signup"),
        //                               style: TextStyle(
        //                                 color: kPrimary,
        //                                 fontWeight: FontWeight.w500,
        //                                 fontSize: 14.sp,
        //                                 decoration: TextDecoration.underline,
        //                               ),
        //                               recognizer: TapGestureRecognizer()
        //                                 ..onTap = () {
        //
        //
        //                                 },
        //                             )
        //                           ],
        //                           style: const TextStyle(
        //                             color: Colors.black38,
        //                           ),
        //                         ),
        //                       ),
        //                     ),
        //                     const SizedBox(
        //                       height: 30,
        //                     ),
        //                   ],
        //                 ),
        //               )),
        //         ),
        //       ],
        //     ),
        //   ),
        // )
    );
  }
}
