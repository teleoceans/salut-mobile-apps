import 'package:flutter/material.dart';

import '../default_form_field.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({
    super.key,
    required this.confirmPassword,
    this.color,
    this.focusColor,
    required this.textColor,
    this.controller,
    this.validator,
  });
  final Color? color;
  final bool confirmPassword;
  final Color? focusColor;
  final Color textColor;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
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
      validator: widget.validator,
      controller: widget.controller,
      textColor: widget.textColor,
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
