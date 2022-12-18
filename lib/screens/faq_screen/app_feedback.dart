import 'package:flutter/material.dart';
import 'package:salute/components/default_button.dart';
import 'package:salute/constants.dart';

class AppFeedbackScreen extends StatelessWidget {
  const AppFeedbackScreen({super.key});
  static const String routeName = "AppFeedbackScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "App Feedback",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
            color: kPrimaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "How would you rate Sault!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 32.0,
                  left: (MediaQuery.of(context).size.width - 314) / 2,
                  right: (MediaQuery.of(context).size.width - 314) / 2,
                ),
                child: Row(
                  children: const [
                    Icon(
                      Icons.star_border,
                      size: 50,
                      color: Color(0xFFFFD600),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.star_border,
                      size: 50,
                      color: Color(0xFFFFD600),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.star_border,
                      size: 50,
                      color: Color(0xFFFFD600),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.star_border,
                      size: 50,
                      color: Color(0xFFFFD600),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.star_border,
                      size: 50,
                      color: Color(0xFFFFD600),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 8,
                  left: (MediaQuery.of(context).size.width - 310) / 2,
                  right: (MediaQuery.of(context).size.width - 310) / 2,
                  bottom: 43,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Poor",
                      style: TextStyle(color: Color.fromARGB(255, 78, 78, 78)),
                    ),
                    Text(
                      "Excellent",
                      style: TextStyle(color: Color.fromARGB(255, 78, 78, 78)),
                    ),
                  ],
                ),
              ),
              const Text(
                "Leave a comment",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Your feedback is important. Let us know your thoughts, suggestions, or if you’ve spotted an issue or a bug.",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  height: 1.3,
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Type Here....",

                  // alignLabelWithHint: true,
                  labelStyle: TextStyle(color: Colors.black),
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              DefaultButton(
                margin: 70,
                text: "Send Feedback",
                onTap: () {},
              ),
              const Spacer(),
              const Text(
                "Need Help?",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "For any current order queries, please use our help center.",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  height: 1.3,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              DefaultButton(
                borderColor: kPrimaryColor,
                backgroundColor: Colors.transparent,
                margin: 70,
                fontWeight: FontWeight.normal,
                textColor: Colors.black,
                text: "Get Help",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
