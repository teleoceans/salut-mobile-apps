import 'package:flutter/material.dart';
import 'package:salute/view/components/default_button.dart';
import 'package:salute/constants.dart';

import '../../components/default_form_field.dart';
import '../../components/registration_components/under_picture_body.dart';

class EnterCodeScreen extends StatelessWidget {
  const EnterCodeScreen({super.key});
  static const String routeName = "EnterCodeScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
              Image.asset("assets/images/enter_code.png"),
              const Spacer(),
              const UnderPictureBody(
                body: "Enter the code that was sent to\n01023456789",
                title: "Phone Verification",
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: const [
                    Expanded(
                      child: DefaultFormField(
                        textColor: Colors.black,
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.black),
                        unFocusColor: kPrimaryColor,
                        focusColor: kPrimaryColor,
                        keyboardType: TextInputType.number,
                        maxCharacters: 1,
                      ),
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    Expanded(
                      child: DefaultFormField(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                        unFocusColor: kPrimaryColor,
                        focusColor: kPrimaryColor,
                        keyboardType: TextInputType.number,
                        maxCharacters: 1,
                      ),
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    Expanded(
                      child: DefaultFormField(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                        unFocusColor: kPrimaryColor,
                        focusColor: kPrimaryColor,
                        keyboardType: TextInputType.number,
                        maxCharacters: 1,
                      ),
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    Expanded(
                      child: DefaultFormField(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                        unFocusColor: kPrimaryColor,
                        focusColor: kPrimaryColor,
                        keyboardType: TextInputType.number,
                        maxCharacters: 1,
                      ),
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    Expanded(
                      child: DefaultFormField(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                        unFocusColor: kPrimaryColor,
                        focusColor: kPrimaryColor,
                        keyboardType: TextInputType.number,
                        maxCharacters: 1,
                      ),
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    Expanded(
                      child: DefaultFormField(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                        unFocusColor: kPrimaryColor,
                        focusColor: kPrimaryColor,
                        keyboardType: TextInputType.number,
                        maxCharacters: 1,
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              DefaultButton(
                text: "Continue",
                onTap: () {
                  // Navigator.pushAndRemoveUntil(
                  //   context,
                  //   //MaterialPageRoute(builder: (context) => const MyHomePage()),
                  // //  ModalRoute.withName(MyHomePage.routeName),
                  // );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
