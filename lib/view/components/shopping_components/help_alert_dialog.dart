import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:salute/constants.dart';

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
                    GestureDetector(
                      child: Text(
                      "${AppLocalizations.of(context)!.chat}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                  ),
                      onTap: (){
                        LaunchUrl("https://m.me/100089473891428");
                      },
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
                    GestureDetector(
                      child: Text(
                      "${AppLocalizations.of(context)!.give}",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                      onTap: (){
                        openPhoneCall( phoneNumber: '0120120120');
                      },
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
