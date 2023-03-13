import 'package:flutter/material.dart';

import 'main.dart';

const Color kPrimaryColor = Color(0xFF472BBE);
const Color kSecondaryColor = Color(0xFFED1B36);
const Color kGreen = Color(0xFF13CB25);
const kTermsAndConditionsColor = Color(0xFF472BBE);
const kNotUsedColor = Color(0xFFEAEAEA);
const kAppBarTitleStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w500,
  fontSize: 24,
);
const Widget kCircularLoadingProgress = Center(
  child: CircularProgressIndicator(
    color: kPrimaryColor,
  ),
);
const kSkipTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 14,
  fontWeight: FontWeight.w400,
);
void kReplaceAllCurrentScreens(
  BuildContext context, {
  required String routeName,
}) {
  Navigator.of(context)
      .pushNamedAndRemoveUntil(routeName, (Route<dynamic> route) => false);
}

AppBar kSkipApp(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    actions: [
      GestureDetector(
        onTap: () =>
            kReplaceAllCurrentScreens(context, routeName: MyHomePage.routeName),
        child: Row(
          children: const [
            Text(
              "Skip ",
              style: kSkipTextStyle,
            ),
            Icon(
              Icons.arrow_forward,
              color: Colors.black,
              size: 25,
            ),
            SizedBox(
              width: 16,
            ),
          ],
        ),
      )
    ],
  );
}

Widget kArrowBack(BuildContext context) {
  return IconButton(
    icon: const Icon(
      Icons.arrow_back,
      size: 30,
      color: kPrimaryColor,
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );
}
