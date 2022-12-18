import 'package:flutter/material.dart';

import '../default_form_field.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField(
      {super.key, required this.confirmPassword, this.color, this.focusColor});
  final Color? color;
  final bool confirmPassword;
  final Color? focusColor;
  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool obscureText = true;
  void toggleVisibilty() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultFormField(
      focusColor: widget.focusColor,
      suffixIcon: widget.confirmPassword
          ? null
          : IconButton(
              icon: Icon(
                obscureText ? Icons.visibility : Icons.visibility_off,
                color: widget.color ?? Colors.white,
              ),
              onPressed: toggleVisibilty,
            ),
      obscureText: obscureText,
      keyboardType: TextInputType.visiblePassword,
      prefixIcon: Icon(
        Icons.lock,
        color: widget.color ?? Colors.white,
      ),
    );
  }
}
