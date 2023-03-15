import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salute/constants.dart';
import 'package:salute/data/providers/shopping_provider.dart';
import 'package:salute/main.dart';
import 'package:salute/view/components/default_button.dart';
import 'package:salute/view/components/registration_components/under_picture_body.dart';
import 'package:salute/view/components/shopping_components/cancel_reason.dart';
import 'package:salute/view/components/shopping_components/help_alert_dialog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CancelOrderScreen extends StatelessWidget {
  const CancelOrderScreen({super.key});
  static const String routeName = "CancelOrderScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/images/cancel_order.png'),
                 UnderPictureBody(
                  body: "${AppLocalizations.of(context)!.reason}",
                  title: "${AppLocalizations.of(context)!.order_cancelled}",

                ),
                const SizedBox(
                  height: 20,
                ),
                const CancelOrderReason(),
                const SizedBox(
                  height: 32,
                ),
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
                  backgroundColor: Colors.transparent,
                  onTap: () {
                    Provider.of<ShoppingProvider>(context, listen: false)
                        .setCurrentIndex = 0;
                    kReplaceAllCurrentScreens(context,
                        routeName: MyHomePage.routeName);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
