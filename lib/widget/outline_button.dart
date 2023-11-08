import 'package:fasta_moni_test/theme/colors.dart';
import 'package:flutter/material.dart';

class OutlineButton extends StatelessWidget {
  const OutlineButton({
    Key? key,
    required this.onClick,
    required this.text,
    this.px = 8,
    this.py = 16,
    this.bgColor = Colors.transparent,
    this.borderColor = KColors.PRIMARY,
    this.textColor = KColors.TEXT,
    this.textSize = 16,
    this.loading = false,
    this.width,
    this.weight = FontWeight.w600,
    this.prefixIcon,
  }) : super(key: key);
  final Function() onClick;
  final String text;
  final double px;
  final double py;
  final Color bgColor;
  final Color borderColor;
  final Color textColor;
  final double textSize;
  final bool loading;
  final double? width;
  final FontWeight weight;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus(); // Unfocus/Hide keyboard
        onClick();
      },
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(vertical: py, horizontal: px),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: borderColor, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (loading)
              SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: KColors.PRIMARY.withOpacity(.25),
                ),
              ),
            if (loading) const SizedBox(width: 8),
            if (prefixIcon != null) prefixIcon!,
            if (prefixIcon != null) const SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                fontWeight: weight,
                fontSize: textSize,
                color: textColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
