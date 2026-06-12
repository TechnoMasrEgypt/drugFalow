
// import 'package:drug_flow/core/localization/lang_keys.dart';
// import 'package:drug_flow/core/utils/helpers.dart';
// import 'package:drug_flow/core/widgets/custom_app_bar.dart';
// import 'package:drug_flow/core/widgets/svg_handler.dart';
// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'dart:math';
// import 'dart:ui' as ui;
// class OtpScreen extends StatefulWidget{

//   OtpScreen({});

//   @override
//   State<OtpScreen> createState() => _OtpScreenState();
// }

// class _OtpScreenState extends State<OtpScreen> {
//   PinInputController pinInputController  = PinInputController();
//   String? pinCode="";
//   int secondsRemaining = 120; // 2 minutes = 120 seconds
//   Timer? timer;
//   @override
//   // void initState() {
//   //   if(widget.params.type == "forgotPass"){
//   //     context.read<ForgotPasswordCubit>().forgetPassword(
//   //         params: ForgetPasswordParams(email: widget.params.email)
//   //         ,context: context);
//   //   }else {
//   //     context.read<OtpCubit>().verifyCode(params: VerifyCodeParams(email: widget.params.email)
//   //         ,context: context);
//   //   }
//   //   startTimer();

//   //   super.initState();
//   // }
//   // void startTimer() {
//   //   timer = Timer.periodic(Duration(seconds: 1), (timer) {
//   //     if (secondsRemaining > 0) {
//   //       setState(() {
//   //         secondsRemaining--;
//   //       });
//   //     } else {
//   //       timer.cancel();
//   //       onTimerComplete();
//   //     }
//   //   });
//   // }

//   // void onTimerComplete() {
//   //   print("Countdown finished!");
//   // }

//   // String get timeFormatted {
//   //   int minutes = secondsRemaining ~/ 60;
//   //   int seconds = secondsRemaining % 60;
//   //   return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
//   // }

//   // @override
//   // void dispose() {
//   //   timer?.cancel();
//   //   super.dispose();
//   // }
//   @override
//   Widget build(BuildContext context) {
//     // final otpCubit = context.read<OtpCubit>();
//     // var fontType = context.locale.languageCode == "en"? montserrat: notoSansArabic;
//     return SafeArea(
//       child: Scaffold(
//         appBar: 
        
//         customAppBar(context: context,title: context.translate(LangKeys.password)) ,
      
//         body: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: context.height/15,),
//               // LanguageItem(),
//               SizedBox(height: context.height/16,),
//               Container(
//                 margin: EdgeInsets.symmetric(horizontal: context.width/30),
//                 alignment: Alignment.center,
//                 child: customSvg(name: splashLogo,color: color1F3D2B
//                     ,width: double.infinity,height: context.height/10,fit: BoxFit.cover),
//               ),
//               SizedBox(height: context.height/18,),
//               Center(
//                 child: Text(tr("check_your_message"),style: TextStyles.textStyleBold24.copyWith(
//                     color: color1F3D2B,
//                   fontFamily: fontType
//                 ),textScaler: TextScaler.linear(1),),
//               ),
//               SizedBox(height: context.height/60,),
//               Container(
//                 alignment: Alignment.center,
//                 margin: EdgeInsets.symmetric(horizontal: context.width/30),
//                 child: Text(tr("change_pass_description"),style: TextStyles.textStyleNormal12.copyWith(
//                     color: color818984,
//                   fontFamily: fontType
//                 ),textScaler: TextScaler.linear(1),textAlign: TextAlign.center,),
//               ),
//               SizedBox(height: context.height/20,),
//               SizedBox(
//                 width: double.infinity,
//                 child: LayoutBuilder(
//                     builder: (context, constraints) {
//                       return SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         padding: EdgeInsets.symmetric(horizontal: 0),
//                         child: ConstrainedBox(
//                           constraints: BoxConstraints(
//                             minWidth: constraints.maxWidth,
//                           ),
//                         child:

//                         Center(
//                           child: Directionality(
//                             textDirection: (context.locale.languageCode == "en" ||
//                                 context.locale.languageCode == "ar") ?
//                             ui.TextDirection.ltr: ui.TextDirection.ltr,
//                             child: MaterialPinField(
//                               pinController: pinInputController,
//                               length: 6,
//                               onCompleted: (pin){
//                                 pinCode = pin;
//                               },

//                               autoFocus: true,
//                               onChanged: (value) => print('Changed: $value'),
//                               theme: MaterialPinTheme(
//                                 shape: MaterialPinShape.circle,
//                                 filledFillColor: white,
//                                 focusedFillColor: white,
//                                 borderColor: colorE8e8e8,
//                                 focusedBorderColor: color1F3D2B,
//                                 filledBorderColor: color1F3D2B,
//                                 fillColor: white,
//                                 completeBorderColor: color1F3D2B,
//                                 completeFillColor: white,

//                                 completeTextStyle: TextStyles.textStyleBold16
//                                     .copyWith(
//                                     color: color1F3D2B,
//                                   fontFamily: fontType
//                                 ),
//                                 textStyle: TextStyles.textStyleBold16.copyWith(
//                                     color: color1F3D2B,
//                                   fontFamily: fontType
//                                 ),
//                                 spacing: 8.0,

//                                 cellSize: Size(context.width/7.5
//                                     , context.width/7.5),
//                               ),
//                             ),
//                           ),)
//                         ),
//                       );
//                     }
//                 ),
//               ),
//               SizedBox(height: context.height/18,),
//               Container(
//                 margin: EdgeInsets.symmetric(horizontal: context.width/20),
//                 height: context.height/15,
//                   width: double.infinity,
//                   child: BlocBuilder<OtpCubit, OtpState>(
//                     builder: (context, state) {
//                       return CustomButton(
//                           isLoading: (context.read<OtpCubit>().verifyLoading! ||
//                               context.read<OtpCubit>().resetLoading!),
//                           btnTitle: tr("verify"),
//                           onPressed: (){
//                            if(pinCode!.isEmpty){
//                               msgKey.currentState!.showSnackBar(SnackBar(
//                                   behavior: SnackBarBehavior.floating,
//                                   content: Text(tr("empty_pin_code"),
//                                     style: TextStyles.textStyleNormal13.copyWith(
//                                       color: white,
//                                       fontFamily: fontType
//                                     )
//                                     ,textScaler: TextScaler.linear(1),)));
//                             }else if(pinCode!.length  < 6) {
//                               msgKey.currentState!.showSnackBar(SnackBar(
//                                   behavior: SnackBarBehavior.floating,
//                                   content: Text(tr("pin_code_6_digits"),
//                                     style: TextStyles.textStyleNormal13.copyWith(
//                                         color: white,
//                                       fontFamily: fontType
//                                     )
//                                     ,textScaler: TextScaler.linear(1),)));
//                             } else {
//                               if(widget.params.type == "forgotPass"){
//                                 context.read<OtpCubit>().verifyReset
//                                   (params: VerifyResetParams(
//                                   email: widget.params.email,
//                                   code: pinCode));
//                               }else {
//                                 context.read<OtpCubit>().verifyAccount(
//                                     params: VerifyAccountParams(
//                                         email: widget.params.email,
//                                         code: pinCode
//                                     )
//                                 );
//                               }}

//                           });
//         },
//       )),
//               SizedBox(height: context.height/20,),
//               Center(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(tr("expired_in")+
//                       timeFormatted,
//                       style: TextStyles.textStyleNormal13.copyWith(
//                         color: color1F3D2B,
//                         fontFamily: fontType
//                       ),textScaler: TextScaler.linear(1),
//                       textAlign: TextAlign.center,
//                     ),
//                     SizedBox(width: context.width/40,),
//                     BlocBuilder<OtpCubit, OtpState>(
//                       builder: (context, state) {
//                         return InkWell(
//                       onTap: (){
//                         context.read<OtpCubit>().resendCode(params: ResendCodeParams(
//                           email: widget.params.email
//                         ),context: context).then((e){
//                           if(otpCubit.resendCodeSuccess == true){
//                             startTimer();
//                           }
//                         });
//                       },
//                       child:
//                       context.read<OtpCubit>().resendCodeLoading == true ?
//                       SpinKitPulse(color: color1F3D2B,size: 20,) :
//                       Text(tr("resend"),
//                         style: TextStyles.textStyleBold13.copyWith(
//                             color: color1F3D2B,
//                             fontFamily: fontType
//                         ),textScaler: TextScaler.linear(1),
//                         textAlign: TextAlign.center,
//                       ),
//                     );},)
//                   ],
//                 ),
//               ),

//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }