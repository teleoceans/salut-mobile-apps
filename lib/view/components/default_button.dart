import 'package:flutter/material.dart';
import 'package:salute/constants.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    this.height,
    required this.text,
    required this.onTap,
    this.backgroundColor,
    this.borderColor,
    this.margin,
    this.textColor,
    this.fontWeight,
    this.width,
    this.textSize,
    this.child,
    this.padding,
  });
  final Color? textColor;
  final double? height;
  final String text;
  final GestureTapCallback onTap;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? margin;
  final FontWeight? fontWeight;
  final double? width;
  final double? textSize;
  final Widget? child;
  final double? padding;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: margin ?? 0),
        padding: EdgeInsets.symmetric(horizontal: padding ?? 0),
        width: width ?? double.infinity,
        height: height ?? 46,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: borderColor ?? kPrimaryColor,
          ),
          color: backgroundColor ?? kPrimaryColor,
        ),
        child: Center(
          child: child ??
              Text(
                text,
                style: TextStyle(
                  color: textColor ?? Colors.white,
                  fontWeight: fontWeight ?? FontWeight.bold,
                  fontSize: textSize ?? 20,
                ),
              ),
        ),
      ),
    );
  }
}
