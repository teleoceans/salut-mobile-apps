import 'package:flutter/material.dart';
import 'package:salute/view/components/default_form_field.dart';
import 'package:salute/view/components/registration_components/date_picker_field.dart';
import 'package:salute/view/components/registration_components/gender_widget.dart';
import 'package:salute/constants.dart';

class AccountInfoScreen extends StatelessWidget {
  const AccountInfoScreen({super.key});
  static const String routeName = 'AccountInfoScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Account Info",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Name",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            DefaultFormField(
              focusColor: Colors.black,
              keyboardType: TextInputType.none,
            ),
            SizedBox(
              height: 36,
            ),
            Text(
              "Email",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            DefaultFormField(
              focusColor: Colors.black,
              keyboardType: TextInputType.none,
            ),
            GenderWidget(
              textColor: Colors.black,
            ),
            SizedBox(
              height: 36,
            ),
            Text(
              "Birthday",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            DatePickerField(
              focusColor: Colors.black,
              prefixColor: kPrimaryColor,
            )
          ],
        ),
      ),
    );
  }
}
