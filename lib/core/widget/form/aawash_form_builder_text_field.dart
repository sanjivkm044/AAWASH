import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AikonFormBuilderTextField extends StatelessWidget {
  const AikonFormBuilderTextField({
    required this.name,
    this.labelText,
    this.keyboardType,
    this.enabled = true,
    this.initialValue,
    this.maxLines = 1,
    this.textInputAction,
    this.hintText,
    this.validator,
    this.valueTransformer,
    this.onChanged,
    this.inputFormatters,
    this.suffixIcon,
    this.onSubmitted,
    this.prefixText,
    super.key,
  });

  final String name;
  final bool enabled;
  final String? labelText;
  final String? initialValue;
  final int? maxLines;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? hintText;
  final FormFieldValidator<String?>? validator;
  final ValueTransformer<String?>? valueTransformer;
  final ValueChanged<String?>? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final ValueChanged<String?>? onSubmitted;
  final String? prefixText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormBuilderTextField(
          key: UniqueKey(),
          maxLines: maxLines,
          textAlign: TextAlign.start,
          name: name,
          enabled: enabled,
          initialValue: initialValue,
          keyboardType: keyboardType ?? TextInputType.text,
          validator: validator,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          enableSuggestions: true, // this is required to enable swipe to type
          inputFormatters: inputFormatters,
          textInputAction: textInputAction,
          valueTransformer: valueTransformer,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            prefixText: prefixText,
            hintText: hintText,
            alignLabelWithHint: true,
            labelText: labelText,
          ),
        ),
      ],
    );
  }
}