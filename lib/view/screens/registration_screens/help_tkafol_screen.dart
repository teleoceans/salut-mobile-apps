import 'package:flutter/material.dart';
import 'package:salute/view/screens/registration_screens/facing_problem_screen.dart';

import '../../components/default_button.dart';
import '../../components/registration_components/under_picture_body.dart';

class HelpWithTkafolScreen extends StatelessWidget {
  const HelpWithTkafolScreen({super.key});
  static const String routeName = "HelpWithTkafolScreen";
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
                  Image.asset("assets/images/tkafol.png"),
                  const Spacer(),
                  const UnderPictureBody(
                    body: "You done it Registration compelete",
                    title: "Help othes with tkafol",
                  ),
                  const Spacer(),
                  DefaultButton(
                    text: "Next",
                    onTap: () {
                      Navigator.pushNamed(
                          context, FacingProblemScreen.routeName);
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
