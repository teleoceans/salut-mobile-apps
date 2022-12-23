import 'package:flutter/material.dart';
import 'package:salute/view/screens/faq_screen/about_us.dart';
import 'package:salute/view/screens/faq_screen/terms_of_use_screen.dart';
import 'package:salute/view/screens/profile_screens/settings_screen.dart';
import 'package:salute/view/screens/shopping_screens/order_history_screen.dart';
import 'package:salute/view/screens/shopping_screens/track_order_screen.dart';

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
                    children: const [
                      Text(
                        "Roba Ibrahim",
                        style: TextStyle(
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
                const DrawerListTile(
                  isImage: true,
                  assetImage: 'assets/images/track_order.png',
                  title: 'Track Order',
                  nextScreen: TrackOrderScreen.routeName,
                ),
                const DrawerListTile(
                  isImage: true,
                  assetImage: 'assets/images/order_history.png',
                  title: 'Order history',
                  nextScreen: OrderHistoryScreen.routeName,
                ),
                DrawerListTile(
                  isImage: false,
                  icon: Icons.favorite,
                  title: 'Favourites',
                  nextScreen: "FavoritesScreen.routeName",
                  onTap: favoritesOnTap,
                ),
                DrawerListTile(
                  isImage: true,
                  assetImage: 'assets/images/invite.png',
                  title: 'Invite',
                  onTap: inviteOnTap,
                  nextScreen: "",
                ),
                DrawerListTile(
                  isImage: true,
                  assetImage: 'assets/images/tkafol_drawer.png',
                  title: 'Tkafol',
                  onTap: tkafolOnTap,
                  nextScreen: '',
                ),
                const DrawerListTile(
                  isImage: false,
                  icon: Icons.settings,
                  title: 'Settings',
                  nextScreen: SettingsScreen.routeName,
                ),
                const DrawerListTile(
                  isImage: true,
                  assetImage: 'assets/images/contact_us_drawer.png',
                  title: 'Contact us',
                  nextScreen: " SettingsScreen.routeName",
                ),
                const DrawerListTile(
                  isImage: true,
                  assetImage: "assets/images/about_us_drawer.png",
                  title: 'About us',
                  nextScreen: AboutUsScreen.routeName,
                ),
                const DrawerListTile(
                  isImage: true,
                  assetImage: "assets/images/terms_of_use.png",
                  title: 'Terms of use',
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
