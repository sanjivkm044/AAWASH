import 'package:aawash/core/constant/padding_constant.dart';
import 'package:aawash/core/theme/aawash_text_style.dart';
import 'package:aawash/core/widget/button/aawash_primary_button.dart';
import 'package:aawash/core/widget/spacer/spacer.dart';
import 'package:aawash/flavors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: PaddingConstant.screenPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SpacerWidget(
              height: 200,
            ),
            Text(
              F.title,
              style: AawashTextStyle.aawashTitle,
            ),
            const SpacerWidget(
              height: 40,
            ),
            FormBuilderTextField(
              name: "Email or Phone",
            ),
            FormBuilderTextField(
              name: " Email ",
              key: UniqueKey(),
              decoration: const InputDecoration(
                hintText: "a",
                labelText: 'b',
                prefixText: '',
                suffixIcon: Text("data"),
                alignLabelWithHint: true,
              ),
              textAlign: TextAlign.start,
              maxLines: 1,
              enabled: true,
              initialValue: "Email or Phone",
              validator: (value) => null,
              onChanged: (value) {},
              onSubmitted: (value) {},
              keyboardType: TextInputType.text,
              enableSuggestions: true,
              inputFormatters: [],
              valueTransformer: (value) {},
              textInputAction: TextInputAction.done,
            ),
            const SpacerWidget(),
            const AawashPrimaryButton(
              title: "Continue",
            ),
            const SpacerWidget(
              height: 230,
            ),
            const Text(
              "By continuing I agree to accept the Privacy \n Policy & terms of Service of Aawash",
              style: AawashTextStyle.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
