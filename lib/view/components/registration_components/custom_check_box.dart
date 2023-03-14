import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salute/constants.dart';

import '../../../data/providers/auth_provider.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key, required this.title, this.function});
  final String title;
  final VoidCallback? function;
  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool currentValue = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            activeColor: kGreen,
            value: currentValue,
            onChanged: (value) {
              Provider.of<AuthProvider>(context, listen: false)
                  .setIsTermsChecked = value!;
              setState(() {
                currentValue = value;
              });
            }),
        Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
