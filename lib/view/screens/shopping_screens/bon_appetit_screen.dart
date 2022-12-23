import 'package:flutter/material.dart';
import 'package:salute/constants.dart';
import 'package:salute/view/components/default_button.dart';

class BonAppetitScreen extends StatelessWidget {
  const BonAppetitScreen({super.key});
  static const String routeName = "BonAppetitScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Image.asset("assets/images/finished_order.png"),
              const Spacer(),
              const Text(
                "Bon appetit",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              DefaultButton(
                text: "Need Support",
                onTap: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultButton(
                text: "Finish",
                textColor: kPrimaryColor,
                borderColor: kPrimaryColor,
                backgroundColor: Colors.transparent,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
