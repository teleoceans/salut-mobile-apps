import 'package:flutter/material.dart';
import 'package:salute/constants.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key, required this.title});
  final String title;
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
              setState(() {
                currentValue = value!;
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
