import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../components/default_button.dart';
import '../../components/registration_components/under_picture_body.dart';
import 'dart:io' show Platform;

class WohooScreen extends StatelessWidget {
  const WohooScreen({super.key});
  static const String routeName = "WohooScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: 32,
            left: 16,
            right: 16,
            bottom: Platform.isAndroid ? 16 : 0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.3,
                child: Image.asset("assets/images/registration_done.png"),
              ),
              const Spacer(),
              const UnderPictureBody(
                body: "You have done it Registration compelete",
                title: "Woohoo!",
              ),
              const Spacer(),
              DefaultButton(
                text: "Next",
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const MyHomePage()),
                    ModalRoute.withName(MyHomePage.routeName),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
