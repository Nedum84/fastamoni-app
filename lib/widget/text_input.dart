import 'package:fasta_moni_test/theme/colors.dart';
import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    Key? key,
    this.controller,
    this.textInputType = TextInputType.text,
    this.maxLines = 1,
    this.hintText = '',
    this.label,
    this.maxLength,
    this.marginBottom,
    this.onChanged,
    this.validator,
    this.enabled = true,
    this.padding,
    this.enabledBorder,
    this.topRightWidget,
  }) : super(key: key);
  final TextEditingController? controller;
  final TextInputType textInputType;
  final int maxLines;
  final String hintText;
  final String? label;
  final int? maxLength;
  final double? marginBottom;
  final Function(String)? onChanged;
  final String? Function(String? value)? validator;
  final bool enabled;
  final EdgeInsetsGeometry? padding;
  final dynamic enabledBorder;
  final Widget? topRightWidget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (label != null)
              Text(
                label!,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            if (label != null) const SizedBox(height: 8),
            TextFormField(
              controller: controller,
              keyboardType: textInputType,
              maxLength: maxLength,
              maxLines: maxLines,
              textAlign: TextAlign.start,
              onChanged: onChanged,
              validator: validator,
              enabled: enabled,
              readOnly: !enabled,
              obscureText: textInputType == TextInputType.visiblePassword ? true : false,
              enableSuggestions: textInputType == TextInputType.visiblePassword ? false : true,
              autocorrect: textInputType == TextInputType.visiblePassword ? false : true,
              decoration: InputDecoration(
                counterText: '',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                focusedBorder: enabledBorder,
                enabledBorder: enabledBorder,
                hintText: hintText,
                hintStyle: const TextStyle(fontSize: 14, color: KColors.TEXT_VERY_LIGHT),
                prefix: Container(width: 14),
                contentPadding: padding,
                filled: !enabled,
                fillColor: !enabled ? Colors.grey.shade100 : null,
              ),
            ),
            SizedBox(height: marginBottom ?? 16),
          ],
        ),
        if (topRightWidget != null)
          Positioned(
            top: 0,
            right: 0,
            child: topRightWidget!,
          )
      ],
    );
  }
}
