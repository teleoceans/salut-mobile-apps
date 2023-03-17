import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salute/constants.dart';
import 'package:salute/data/providers/auth_provider.dart';
import 'package:salute/view/components/shopping_components/help_alert_dialog.dart';
import 'package:salute/view/screens/faq_screen/about_us.dart';
import 'package:salute/view/screens/faq_screen/terms_of_use_screen.dart';
import 'package:salute/view/screens/profile_screens/settings_screen.dart';
import 'package:salute/view/screens/shopping_screens/order_history_screen.dart';
import 'package:salute/view/screens/shopping_screens/track_order_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'drawer_list_tile.dart';

class GlobalDrawer extends StatelessWidget {
  const GlobalDrawer({
    super.key,
    required this.favoritesOnTap,
    required this.tkafolOnTap,
    required this.inviteOnTap,
  });
  final GestureTapCallback favoritesOnTap;
  final GestureTapCallback tkafolOnTap;
  final GestureTapCallback inviteOnTap;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            margin: const EdgeInsets.all(0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  height: 70,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        Provider.of<AuthProvider>(context, listen: false)
                            .userName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 34,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                  DrawerListTile(
                  isImage: true,
                  assetImage: 'assets/images/track_order.png',
                  title:  "${AppLocalizations.of(context)!.track_order}",
                  nextScreen: TrackOrderScreen.routeName,
                ),
                  DrawerListTile(
                  isImage: true,
                  assetImage: 'assets/images/order_history.png',
                  title: "${AppLocalizations.of(context)!.history_order}",
                  nextScreen: OrderHistoryScreen.routeName,
                ),
                DrawerListTile(
                  isImage: false,
                  icon: Icons.favorite,
                  title: "${AppLocalizations.of(context)!.favourites}",
                  nextScreen: "FavoritesScreen.routeName",
                  onTap: favoritesOnTap,
                ),
                DrawerListTile(
                  isImage: true,
                  assetImage: 'assets/images/invite.png',
                  title:  "${AppLocalizations.of(context)!.invite}",
                  onTap: inviteOnTap,
                  nextScreen: "",
                ),
                DrawerListTile(
                  isImage: true,
                  assetImage: 'assets/images/tkafol_drawer.png',
                  title: "${AppLocalizations.of(context)!.tkafol}",
                  onTap: tkafolOnTap,
                  nextScreen: '',
                ),
                  DrawerListTile(
                  isImage: false,
                  icon: Icons.settings,
                  title:  "${AppLocalizations.of(context)!.settings}",
                  nextScreen: SettingsScreen.routeName,
                ),
                  DrawerListTile(
                  isImage: true,
                  assetImage: 'assets/images/contact_us_drawer.png',
                  title: "${AppLocalizations.of(context)!.contactus}",
                  nextScreen: " SettingsScreen.routeName",
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (context) => const HelpAlertDialog(),
                    );
                      //LaunchUrl("https://m.me/100089473891428");
                  },
                ),
                  DrawerListTile(
                  isImage: true,
                  assetImage: "assets/images/about_us_drawer.png",
                  title:"${AppLocalizations.of(context)!.aboutUs}",
                  nextScreen: AboutUsScreen.routeName,
                ),
                  DrawerListTile(
                  isImage: true,
                  assetImage: "assets/images/terms_of_use.png",
                  title:"${AppLocalizations.of(context)!.terms}",
                  nextScreen: TermsOfUseScreen.routeName,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
