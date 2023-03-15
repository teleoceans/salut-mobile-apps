import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HelpAlertDialog extends StatelessWidget {
  const HelpAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:   Text(
        "${AppLocalizations.of(context)!.receive}",
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
                    Text(
                    "${AppLocalizations.of(context)!.chat}",
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
                    Text(
                    "${AppLocalizations.of(context)!.type_here}",//give
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
