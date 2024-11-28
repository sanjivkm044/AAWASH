// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:aawash/core/constant/padding_constant.dart';
import 'package:aawash/core/theme/aawash_text_color.dart';
import 'package:aawash/core/theme/aawash_text_style.dart';
import 'package:aawash/core/widget/button/aawash_primary_button.dart';
import 'package:aawash/core/widget/spacer/spacer.dart';
import 'package:flutter/material.dart';

class BuyOrRentScreen extends StatefulWidget {
  const BuyOrRentScreen({
    super.key,
  });
  static const String route = 'buy_rent_screen';

  @override
  State<BuyOrRentScreen> createState() => _BuyOrRentScreenState();
}

class _BuyOrRentScreenState extends State<BuyOrRentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AawashColor.white,
        leading: const Icon(Icons.arrow_back),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: PaddingConstant.screenPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SpacerWidget(
                height: 120,
              ),
              Text(
                "I’m looking To",
                style: AawashTextStyle.titleSmall?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SpacerWidget(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 88,
                    width: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: AawashColor.grey200,
                        width: 1,
                      ),
                    ),
                    child: const Text(
                      "Buy/Rent a \n property",
                      style: AawashTextStyle.titleSmall,
                    ),
                  ),
                  const SpacerWidget(
                    width: 20,
                  ),
                  Container(
                    height: 88,
                    width: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: AawashColor.grey200,
                        width: 1,
                      ),
                    ),
                    child: const Text(
                      "Sell a property",
                      style: AawashTextStyle.titleSmall,
                    ),
                  ),
                ],
              ),
              const SpacerWidget(
                height: 50,
              ),
              const SpacerWidget(),
              AawashPrimaryButton(
                text: "CONTINUE",
                onPressed: () {
                  log(" Continue Button Pressed!");
                },
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
