import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salute/constants.dart';

class PaymentMethodsContainer extends StatelessWidget {
  const PaymentMethodsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
            spreadRadius: 3,
          )
        ],
      ),
      child: Theme(
        data: ThemeData().copyWith(unselectedWidgetColor: Colors.black),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Payment Methods",
              style: TextStyle(
                color: Color.fromARGB(255, 63, 63, 63),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const Icon(
                  FontAwesomeIcons.dollarSign,
                  color: kPrimaryColor,
                ),
                const SizedBox(
                  width: 4,
                ),
                const Text(
                  "Cash on delivery",
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 15,
                  ),
                ),
                const Spacer(),
                Radio(
                  activeColor: Colors.green,
                  focusColor: Colors.green,
                  value: 1,
                  groupValue: 1,
                  onChanged: (value) {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
