import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              Text(
              "${AppLocalizations.of(context)!.size}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Text(
                 "${AppLocalizations.of(context)!.small}",
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
                  Text(
                  "${AppLocalizations.of(context)!.medium}",
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
                  Text(
                  "${AppLocalizations.of(context)!.large}",
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
