import 'package:flutter/material.dart';
import 'package:salute/constants.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({
    super.key,
    required this.title,
    required this.isIcon,
    this.prefixIcon,
    this.suffixText,
    this.suffixTextColor,
    this.fontWeight,
    required this.isShadow,
  });
  final String? prefixIcon;
  final String title;
  final String? suffixText;
  final Color? suffixTextColor;
  final FontWeight? fontWeight;
  final bool isIcon;
  final bool isShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          isShadow
              ? BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 2,
                  spreadRadius: 3,
                )
              : const BoxShadow(
                  color: Colors.transparent,
                  blurRadius: 0,
                  spreadRadius: 0,
                ),
        ],
      ),
      child: Row(
        children: [
          if (prefixIcon != null)
            isIcon
                ? const Icon(
                    Icons.favorite,
                    color: kPrimaryColor,
                    size: 30,
                  )
                : Image.asset(
                    prefixIcon!,
                    width: 30,
                  ),
          const SizedBox(
            width: 16,
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 21,
              fontWeight: fontWeight ?? FontWeight.normal,
            ),
          ),
          const Spacer(),
          if (suffixText != null)
            Text(
              suffixText!,
              style: TextStyle(
                color: suffixTextColor ?? Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
        ],
      ),
    );
  }
}
