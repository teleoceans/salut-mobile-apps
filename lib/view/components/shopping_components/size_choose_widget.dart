import 'package:flutter/material.dart';

class SizeChooseWidget extends StatefulWidget {
  const SizeChooseWidget({super.key});

  @override
  State<SizeChooseWidget> createState() => _SizeChooseWidgetState();
}

class _SizeChooseWidgetState extends State<SizeChooseWidget> {
  int currentValue = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Theme(
        data: ThemeData().copyWith(
          unselectedWidgetColor: Colors.black,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 12,
            ),
            const Text(
              "Choose size:",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Small    ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                Radio(
                    activeColor: Colors.green,
                    focusColor: Colors.green,
                    value: 0,
                    groupValue: currentValue,
                    onChanged: (value) {
                      setState(() {
                        currentValue = value!;
                      });
                    }),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Medium",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                Radio(
                    activeColor: Colors.green,
                    focusColor: Colors.green,
                    value: 1,
                    groupValue: currentValue,
                    onChanged: (value) {
                      setState(() {
                        currentValue = value!;
                      });
                    }),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Large    ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                Radio(
                    activeColor: Colors.green,
                    focusColor: Colors.green,
                    value: 2,
                    groupValue: currentValue,
                    onChanged: (value) {
                      setState(() {
                        currentValue = value!;
                      });
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
