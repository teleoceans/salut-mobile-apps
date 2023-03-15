import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salute/constants.dart';
import 'package:salute/data/providers/shopping_provider.dart';
import 'package:salute/main.dart';
import 'package:salute/view/components/default_button.dart';
import 'package:salute/view/components/shopping_components/help_alert_dialog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class BonAppetitScreen extends StatelessWidget {
  const BonAppetitScreen({super.key});
  static const String routeName = "BonAppetitScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Image.asset("assets/images/finished_order.png"),
              const Spacer(),
              Text(
                "${AppLocalizations.of(context)!.appetit}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              DefaultButton(
                text: "${AppLocalizations.of(context)!.support}",
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const HelpAlertDialog(),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultButton(
                text: "${AppLocalizations.of(context)!.finish}",
                textColor: kPrimaryColor,
                borderColor: kPrimaryColor,
                backgroundColor: Colors.transparent,
                onTap: () {
                  Provider.of<ShoppingProvider>(context, listen: false)
                      .setCurrentIndex = 0;
                  kReplaceAllCurrentScreens(
                    context,
                    routeName: MyHomePage.routeName,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
