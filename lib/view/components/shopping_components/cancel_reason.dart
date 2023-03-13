import 'package:flutter/material.dart';
import 'package:salute/view/components/default_form_field.dart';

class CancelOrderReason extends StatefulWidget {
  const CancelOrderReason({super.key});

  @override
  State<CancelOrderReason> createState() => _CancelOrderReasonState();
}

class _CancelOrderReasonState extends State<CancelOrderReason> {
  final FocusNode textFormFieldFocusNode = FocusNode();
  int currentValue = 10;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(
        unselectedWidgetColor: Colors.black,
      ),
      child: GestureDetector(
        onTap: () {
          textFormFieldFocusNode.unfocus();
        },
        child: Column(
          children: [
            Row(
              children: [
                Radio(
                  activeColor: Colors.green,
                  focusColor: Colors.green,
                  value: 0,
                  groupValue: currentValue,
                  onChanged: (value) {
                    setState(
                      () {
                        currentValue = value!;
                      },
                    );
                  },
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  "Order took too long",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Radio(
                  activeColor: Colors.green,
                  focusColor: Colors.green,
                  value: 1,
                  groupValue: currentValue,
                  onChanged: (value) {
                    setState(
                      () {
                        currentValue = value!;
                      },
                    );
                  },
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  "I don’t want it anymore",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Radio(
                  activeColor: Colors.green,
                  focusColor: Colors.green,
                  value: 2,
                  groupValue: currentValue,
                  onChanged: (value) {
                    setState(
                      () {
                        currentValue = value!;
                      },
                    );
                  },
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  "Other",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            DefaultFormField(
              textColor: Colors.black,
              focusNode: textFormFieldFocusNode,
              enabled: currentValue == 2,
              keyboardType:
                  currentValue == 2 ? TextInputType.none : TextInputType.text,
              hintText: "Type Here...",
              focusColor: Colors.black,
              maxLines: 5,
              borderRadius: 12,
            )
          ],
        ),
      ),
    );
  }
}
