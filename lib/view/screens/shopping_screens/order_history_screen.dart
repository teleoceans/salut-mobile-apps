import 'package:flutter/material.dart';
import 'package:salute/constants.dart';
import 'package:salute/view/components/registration_components/under_picture_body.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});
  static const String routeName = "OrderHistoryScreen";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: kArrowBack(context),
          title:   Text(
            "${AppLocalizations.of(context)!.order}",
            style: kAppBarTitleStyle,
          ),
          bottom:   TabBar(
            unselectedLabelColor: Colors.grey,
            labelColor: kPrimaryColor,
            indicatorColor: kPrimaryColor,
            labelStyle: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            tabs: [
              Tab(
                text: "${AppLocalizations.of(context)!.ongoing}",
              ),
              Tab(
                text:"${AppLocalizations.of(context)!.history}",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 32,
              ),
              child: Column(
                children: [
                  Image.asset('assets/images/no_order_history.png'),
                  const Spacer(),
                    UnderPictureBody(
                    body: "${AppLocalizations.of(context)!.mass_order1}",
                    title:  "${AppLocalizations.of(context)!.mass_order2}",
                  ),
                  const Spacer(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 32,
              ),
              child: Column(
                children: [
                  Image.asset('assets/images/no_order_history.png'),
                  const Spacer(),
                    UnderPictureBody(
                      body: "${AppLocalizations.of(context)!.mass_order1}",
                      title:  "${AppLocalizations.of(context)!.mass_order2}",
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
