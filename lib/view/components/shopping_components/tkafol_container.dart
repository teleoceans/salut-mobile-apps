import 'package:flutter/material.dart';

import '../default_button.dart';

class TkafolComponent extends StatelessWidget {
  const TkafolComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        children: [
          Image.asset(
            "assets/images/tkafol_drawer.png",
            width: 50,
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            "You have",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          RichText(
            text: const TextSpan(
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 40,
              ),
              children: [
                TextSpan(
                  text: "200.00",
                ),
                TextSpan(
                  text: "  pt",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "What is Tkafol",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      content: const Text(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Magna non, mauris pulvinar non scelerisque nullam tellus nec.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Magna non, mauris pulvinar non scelerisque nullam tellus nec.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Magna non, mauris pulvinar non scelerisque nullam tellus nec.",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 16.0,
            left: 50,
            right: 50,
          ),
          child: DefaultButton(
            text: "Get it",
            onTap: () {
              Navigator.pop(context);
            },
          ),
        )
      ],
    );
  }
}
