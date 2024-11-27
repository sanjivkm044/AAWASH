import 'package:aawash/core/theme/aawash_text_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class TextFormFieldBuilder extends StatelessWidget {
  final String name;
  final String? initialValue;
  final String? hintText;
  final String? labelText;
  final String? prefixText;
  final int? maxLines;
  final bool alignLabelWithHint;
  final bool enabled;
  final bool enableSuggestions;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextAlign textAlign;
  final FormFieldValidator<String?>? validator;
  final ValueChanged<String?>? onChanged;
  final ValueChanged<String?>? onSubmitted;
  final ValueTransformer<String?>? valueTransformer;
  final List<TextInputFormatter>? inputFormatters;
  final Color? enabledBorderColor;
  final Color? disabledBorderColor;
  final BorderRadius? borderRadius;

  const TextFormFieldBuilder({
    required this.name,
    this.initialValue,
    this.hintText,
    this.labelText,
    this.prefixText,
    this.maxLines,
    this.alignLabelWithHint = false,
    this.enabled = true,
    this.enableSuggestions = true,
    this.onChanged,
    this.validator,
    this.onSubmitted,
    this.valueTransformer,
    this.textAlign = TextAlign.start,
    this.textInputAction,
    this.inputFormatters,
    this.keyboardType,
    this.borderRadius,
    this.enabledBorderColor = AawashColor.blue,
    this.disabledBorderColor = AawashColor.grey100,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      key: UniqueKey(), 
      initialValue: initialValue,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixText: prefixText,
        alignLabelWithHint: alignLabelWithHint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: enabledBorderColor ?? AawashColor.blue,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: disabledBorderColor ?? AawashColor.grey100,
          ),
        ),
      ),
      textAlign: textAlign,
      maxLines: maxLines ?? 1,
      enabled: enabled,
      keyboardType: keyboardType ?? TextInputType.text,
      enableSuggestions: enableSuggestions,
      inputFormatters: inputFormatters,
      validator: validator,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      valueTransformer: valueTransformer,
      textInputAction: textInputAction ?? TextInputAction.done,
    );
  }
}
