import 'package:flutter/material.dart';
import 'package:salute/main.dart';

import '../../components/default_button.dart';
import '../../components/registration_components/under_picture_body.dart';

class WohooScreen extends StatelessWidget {
  const WohooScreen({super.key});
  static const String routeName = "WohooScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 32,
                left: 16,
                right: 16,
                bottom: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/registration_done.png"),
                  const Spacer(),
                  const UnderPictureBody(
                    body: "You done it Registration compelete",
                    title: "Woohoo!",
                  ),
                  const Spacer(),
                  DefaultButton(
                    text: "Next",
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyHomePage()),
                        ModalRoute.withName(MyHomePage.routeName),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
