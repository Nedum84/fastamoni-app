import 'package:fasta_moni_test/theme/colors.dart';
import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    Key? key,
    this.controller,
    this.maxLines = 1,
    this.hintText = '',
    this.label,
    this.borderBottom,
    this.onChanged,
    this.validator,
    this.enabled = true,
  }) : super(key: key);
  final TextEditingController? controller;
  final int maxLines;
  final String hintText;
  final String? label;
  final double? borderBottom;
  final Function(String)? onChanged;
  final String? Function(String? value)? validator;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    bool show = false;

    return StatefulBuilder(builder: (context, setState) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Text(label!,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                )),
          if (label != null) const SizedBox(height: 8),
          TextFormField(
            controller: controller,
            maxLength: 25,
            maxLines: 1,
            textAlign: TextAlign.start,
            onChanged: onChanged,
            validator: validator,
            obscureText: !show ? true : false,
            enableSuggestions: !show ? false : true,
            autocorrect: !show ? false : true,
            enabled: enabled,
            readOnly: !enabled,
            decoration: InputDecoration(
              counterText: '',
              floatingLabelBehavior: FloatingLabelBehavior.never,
              hintText: hintText,
              prefix: Container(width: 14),
              hintStyle: const TextStyle(fontSize: 14, color: KColors.TEXT_VERY_LIGHT),
              suffixIcon: InkWell(
                onTap: () => setState(() => show = !show),
                child: Container(
                  width: 60,
                  alignment: Alignment.center,
                  child: Icon(
                    show ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                    color: KColors.TEXT_LIGHT,
                  ),
                ),
              ),
              filled: !enabled,
              fillColor: !enabled ? Colors.grey.shade100 : null,
            ),
          ),
          SizedBox(height: borderBottom ?? 16),
        ],
      );
    });
  }
}
