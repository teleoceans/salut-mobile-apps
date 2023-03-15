import 'package:flutter/material.dart';
import 'package:salute/view/components/shopping_components/help_alert_dialog.dart';
import 'package:salute/view/screens/shopping_screens/bon_appetit_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              Text(
                "${AppLocalizations.of(context)!.received_meal}",
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
                  Text(
                  "${AppLocalizations.of(context)!.yes}",
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
                        builder: (context) => const HelpAlertDialog(),
                      );
                    }),
                  Text(
                 "${AppLocalizations.of(context)!.no}",
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
