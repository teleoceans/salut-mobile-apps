import 'package:flutter/material.dart';

class UnderPictureBody extends StatelessWidget {
  const UnderPictureBody({
    super.key,
    required this.body,
    required this.title,
  });
  final String title;
  final String body;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 32,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        Text(
          body,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
