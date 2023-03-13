import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultFormField extends StatelessWidget {
  const DefaultFormField({
    Key? key,
    required this.keyboardType,
    this.validator,
    this.maxLines,
    this.labelText,
    this.controller,
    this.onTap,
    this.focusNode,
    this.textInputAction,
    this.focusColor,
    this.unFocusColor,
    this.maxCharacters,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.textColor,
    this.borderRadius,
    this.hintText,
    this.enabled,
    this.textStyle,
    this.hintStyle,
  }) : super(key: key);
  final String? labelText;
  final TextInputType keyboardType;
  final String? hintText;
  final int? maxLines;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final GestureTapCallback? onTap;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final Color? unFocusColor;
  final Color? focusColor;
  final int? maxCharacters;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final Color? textColor;
  final double? borderRadius;
  final bool? enabled;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled ?? true,
      style: textStyle ??
          TextStyle(
            color: textColor ?? Colors.white,
          ),
      focusNode: focusNode,
      textInputAction: textInputAction ?? TextInputAction.next,
      onTap: onTap,
      controller: controller,
      inputFormatters: [
        LengthLimitingTextInputFormatter(maxCharacters ?? 100),
      ],
      validator: validator,
      obscureText: obscureText ?? false,
      maxLines: maxLines ?? 1,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            borderRadius ?? 100,
          ),
        ),
        alignLabelWithHint: true,
        labelText: labelText,
        hintText: hintText,
        hintStyle: hintStyle,
        labelStyle: const TextStyle(color: Colors.black),
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 100),
          borderSide: BorderSide(
            color: focusColor ?? Colors.white,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 100),
          borderSide: BorderSide(
            color: unFocusColor ?? const Color.fromARGB(255, 182, 182, 182),
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
