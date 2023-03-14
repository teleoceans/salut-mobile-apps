import 'package:flutter/material.dart';

class HelpAlertDialog extends StatelessWidget {
  const HelpAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Didn’t receive your meal?',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      content: Wrap(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/support_icon.png',
                    width: 30,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    "Chat with us",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/phone_call.png',
                    width: 30,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    "Give us a call",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
