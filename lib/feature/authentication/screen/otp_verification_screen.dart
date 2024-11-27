import 'dart:developer';

import 'package:aawash/core/constant/padding_constant.dart';
import 'package:aawash/core/theme/aawash_text_color.dart';
import 'package:aawash/core/theme/aawash_text_style.dart';
import 'package:aawash/core/widget/button/aawash_primary_button.dart';
import 'package:aawash/core/widget/spacer/spacer.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});
  static const route = 'otpscreen';
  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController pinputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AawashColor.white,
        leading: const Icon(Icons.arrow_back),
        title: const Text(
          " OTP Verification",
          style: AawashTextStyle.titleLargeWhite,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: PaddingConstant.screenPadding,
          child: Column(
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
                        color: Colors.blue, // Highlighted border color
                        width: 3, // Border width when focused
                      ),
                    ),
                  ),
                ),
                length: 4, // Number of input fields
                controller: pinputController,
                autofocus: true,
              ),
              const SpacerWidget(
                height: 20,
              ),
              AawashPrimaryButton(
                text: "VERIFY CODE",
                onPressed: () {
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
          ),
        ),
      ),
    );
  }
}
