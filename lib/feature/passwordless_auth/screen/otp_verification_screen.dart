import 'dart:developer';

import 'package:aawash/core/constant/padding_constant.dart';
import 'package:aawash/core/locator/locator.dart';
import 'package:aawash/core/theme/aawash_text_color.dart';
import 'package:aawash/core/theme/aawash_text_style.dart';
import 'package:aawash/core/widget/button/aawash_primary_button.dart';
import 'package:aawash/core/widget/spacer/spacer.dart';
import 'package:aawash/feature/passwordless_auth/bloc/verify_otp_code/verify_otp_bloc.dart';
import 'package:aawash/feature/passwordless_auth/bloc/verify_otp_code/verify_otp_event.dart';
import 'package:aawash/feature/passwordless_auth/bloc/verify_otp_code/verify_otp_state.dart';
import 'package:aawash/feature/passwordless_auth/screen/rent_or_buy_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});
  static const String route = 'otpscreen';
  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController pinputController = TextEditingController();
  final VerifyOtpBloc verifyCodeBloc = getIt<VerifyOtpBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AawashColor.white,
        leading: InkWell(
          child: const Icon(
            Icons.arrow_back,
          ),
          onTap: () {
            context.pop();
          },
        ),
        title: const Text(
          " OTP Verification",
          style: AawashTextStyle.titleLargeWhite,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: PaddingConstant.screenPadding,
          child: BlocConsumer<VerifyOtpBloc, VerifyOtpState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SpacerWidget(
                    height: 60,
                  ),
                  const Text(
                    "An OTP has been sent to you\n phone +977 9852131223",
                    style: AawashTextStyle.titleSmall,
                  ),
                  const SpacerWidget(
                    height: 40,
                  ),
                  Pinput(
                    defaultPinTheme: const PinTheme(
                      width: 56,
                      height: 56,
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AawashColor.grey,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    focusedPinTheme: const PinTheme(
                      width: 56,
                      height: 56,
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.blue,
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                    onCompleted: (value) {
                      log(state.toString());
                      if (state is VerifyOtpSuccessState) {
                        verifyCodeBloc.add(
                          VerifyOtpCodeEvent(
                            state.message,
                            pinputController.text.toString(),
                          ),
                        );
                      }
                    },
                    length: 6,
                    autofocus: true,
                  ),
                  const SpacerWidget(
                    height: 20,
                  ),
                  AawashPrimaryButton(
                    text: "VERIFY CODE",
                    onPressed: () {
                      if (state is VerifyOtpSuccessState) {
                        verifyCodeBloc.add(
                          VerifyOtpCodeEvent(
                            state.message,
                            pinputController.text.toString(),
                          ),
                        );
                      }

                      context.goNamed(BuyOrRentScreen.route);
                      log(" Verify Code Button Pressed!");
                    },
                    color: AawashColor.primaryGrey,
                  ),
                  const SpacerWidget(
                    height: 66,
                  ),
                  const Text(
                    "Didn’t get the code?",
                    style: AawashTextStyle.titleSmall,
                  ),
                  const SpacerWidget(
                    height: 10,
                  ),
                  const Text(
                    " Resend OTP",
                    style: AawashTextStyle.titleSmall,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
