import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:salute/view/screens/registration_screens/facing_problem_screen.dart';

import '../../../constants.dart';
import '../../components/default_button.dart';
import '../../components/registration_components/under_picture_body.dart';

class HelpWithTkafolScreen extends StatelessWidget {
  const HelpWithTkafolScreen({super.key});
  static const String routeName = "HelpWithTkafolScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kSkipApp(context),
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
                height: MediaQuery.of(context).size.height / 2.2,
                child: Image.asset("assets/images/tkafol.png"),
              ),
              const Spacer(),
              const UnderPictureBody(
                body: "You done it Registration compelete",
                title: "Help othes with tkafol",
              ),
              const Spacer(),
              DefaultButton(
                text: "Next",
                onTap: () {
                  Navigator.pushNamed(context, FacingProblemScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
