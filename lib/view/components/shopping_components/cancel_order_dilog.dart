
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:salute/constants.dart';
import 'package:salute/data/helpers/shared_preferences.dart';
import 'package:salute/data/providers/products_provider.dart';
import 'package:salute/data/providers/shopping_provider.dart';
import 'package:salute/main.dart';
import 'package:salute/view/components/default_button.dart';
import 'package:salute/view/screens/shopping_screens/cancel_order_screen.dart';

class CancelOrderDialog extends StatefulWidget {
  final id;
  const CancelOrderDialog({required this.id});
  State<CancelOrderDialog> createState() => _CancelOrderDialogState();
}

class _CancelOrderDialogState extends State<CancelOrderDialog> {
  bool isLoading = false;
  bool isSuccess = true;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:  Text(
        "${AppLocalizations.of(context)!.cancel_mass}",
        textAlign: TextAlign.center,
        maxLines: 2,
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
              DefaultButton(
                text: "${AppLocalizations.of(context)!.yes}",
                backgroundColor: Colors.transparent,
                textColor: kPrimaryColor,
                onTap: () {
                  CancelOrder("${widget.id}");
                  //Navigator.of(context, rootNavigator: true).pop();
                },
              ),
              const SizedBox(
                height: 16,
              ),
              DefaultButton(
                text: "${AppLocalizations.of(context)!.no}",
                onTap: () async{
                  Navigator.of(context, rootNavigator: true).pop();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
  void CancelOrder(id) async {
    isSuccess = true;
    setState(() {
      isLoading = true;
    });
    String token = await SharedPreferencesHelper.getSavedUser();
    await Provider.of<ProductsProvider>(context, listen: false)
        .CancelOrder(token: token, id: "${id}",)
        .catchError((error) {
      isSuccess = false;
      print(error.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Something went wrong. Try again later")),
      );
      setState(() {
        isLoading = false;
      });
    })
        .then((value) {
      setState(() {
        isLoading = false;
      });
      if (isSuccess) {
        Provider.of<ShoppingProvider>(context, listen: false).setCurrentIndex =0;
        //Navigator.of(context, rootNavigator: true).popAndPushNamed(MyHomePage.routeName);
        Navigator.of(context, rootNavigator: true).popAndPushNamed(CancelOrderScreen.routeName);
      }
    });
  }
}