import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salute/data/helpers/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:salute/data/providers/auth_provider.dart';
import 'package:salute/main.dart';

import '../default_button.dart';

class TkafolComponent extends StatelessWidget {
  const TkafolComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        children: [
          Image.asset(
            "assets/images/tkafol_drawer.png",
            width: 50,
          ),
          const SizedBox(
            height: 12,
          ),
            Text(
            "${AppLocalizations.of(context)!.you_have}",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          RichText(
            text:   TextSpan(
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 40,
              ),
              children: [
                TextSpan(
                  text: "${Provider.of<AuthProvider>(context, listen: false).authToken.isEmpty?0:SharedPreferencesHelper.data['points']==null?0:SharedPreferencesHelper.data['points']} ",
                ),
                TextSpan(
                  text: "  pt",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
            Text(
            "${AppLocalizations.of(context)!.wh_tkafol}",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      content:   Text(
        "${AppLocalizations.of(context)!.mass_tkafol}",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 16.0,
            left: 50,
            right: 50,
          ),
          child: DefaultButton(
            text: "${AppLocalizations.of(context)!.get}",
            onTap: () {
              Navigator.pop(context);
            },
          ),
        )
      ],
    );
  }
}
