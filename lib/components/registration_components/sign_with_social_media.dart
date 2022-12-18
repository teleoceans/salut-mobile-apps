import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignWithSocialMedia extends StatelessWidget {
  const SignWithSocialMedia({super.key, this.title});
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title ?? "Sign in with",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(color: Colors.white, width: 1),
              ),
              child: const Center(
                  child: Icon(
                FontAwesomeIcons.apple,
                color: Colors.white,
                size: 40,
              )),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(color: Colors.white, width: 1),
              ),
              child: const Center(
                  child: Icon(
                FontAwesomeIcons.facebook,
                color: Colors.blue,
                size: 40,
              )),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(color: Colors.white, width: 1),
              ),
              child: const Center(
                  child: Icon(
                FontAwesomeIcons.google,
                color: Colors.green,
                size: 40,
              )),
            ),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 1,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            const Text(
              "or",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Container(
                height: 1,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
