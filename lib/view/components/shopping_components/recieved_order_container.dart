import 'package:flutter/material.dart';
import 'package:salute/view/screens/shopping_screens/bon_appetit_screen.dart';

class RecievedOrderContainer extends StatefulWidget {
  const RecievedOrderContainer({super.key});

  @override
  State<RecievedOrderContainer> createState() => _RecievedOrderContainerState();
}

class _RecievedOrderContainerState extends State<RecievedOrderContainer> {
  int currentValue = 3;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 16,
        left: 16,
      ),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(15),
        color: Colors.transparent,
      ),
      child: Theme(
        data: ThemeData().copyWith(
          unselectedWidgetColor: Colors.black,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Have you received your meal ?",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Radio(
                    value: 0,
                    groupValue: currentValue,
                    activeColor: Colors.green,
                    focusColor: Colors.green,
                    onChanged: (value) {
                      setState(() {
                        currentValue = value!;
                      });
                      int count = 0;
                      Navigator.pushNamedAndRemoveUntil(context,
                          BonAppetitScreen.routeName, (route) => count++ >= 2);
                    }),
                const Text(
                  "yes",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: 1,
                    groupValue: currentValue,
                    activeColor: Colors.green,
                    focusColor: Colors.green,
                    onChanged: (value) {
                      setState(() {
                        currentValue = value!;
                      });
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
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
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 16),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                const Text(
                  "no",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
