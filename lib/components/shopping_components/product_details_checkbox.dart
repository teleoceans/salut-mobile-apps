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
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 3,
                        color: Colors.black.withOpacity(0.1),
                      )
                    ],
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
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 3,
                        color: Colors.black.withOpacity(0.1),
                      )
                    ],
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
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 3,
                        color: Colors.black.withOpacity(0.1),
                      )
                    ],
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

class ExtrasCheckBox extends StatefulWidget {
  const ExtrasCheckBox({super.key});

  @override
  State<ExtrasCheckBox> createState() => _ExtrasCheckBoxState();
}

class _ExtrasCheckBoxState extends State<ExtrasCheckBox> {
  bool currentValue = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "title       ",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 2,
                  blurRadius: 3,
                  color: Colors.black.withOpacity(0.1),
                )
              ],
            ),
          ),
          Theme(
            data: ThemeData().copyWith(
              unselectedWidgetColor: Colors.black,
            ),
            child: Checkbox(
                activeColor: Colors.green,
                value: currentValue,
                onChanged: (value) {
                  setState(() {
                    currentValue = value!;
                  });
                }),
          ),
        ],
      ),
    );
  }
}
