import 'package:flutter/material.dart';
import 'package:salute/screens/faq_screen/about_us.dart';
import 'package:salute/screens/faq_screen/terms_of_use_screen.dart';
import 'package:salute/screens/profile_screens/settings_screen.dart';
import 'package:salute/screens/shopping_screens/track_order_screen.dart';

import 'drawer_list_tile.dart';

class GlobalDrawer extends StatelessWidget {
  const GlobalDrawer({super.key});

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
              children: const [
                DrawerListTile(
                  isImage: true,
                  assetImage: 'assets/images/track_order.png',
                  title: 'Track Order',
                  nextScreen: TrackOrderScreen.routeName,
                ),
                DrawerListTile(
                  isImage: true,
                  assetImage: 'assets/images/order_history.png',
                  title: 'Order history',
                  nextScreen: "MainScreen.routeName",
                ),
                DrawerListTile(
                  isImage: false,
                  icon: Icons.favorite,
                  title: 'Favourites',
                  nextScreen: "FavoritesScreen.routeName",
                ),
                DrawerListTile(
                  isImage: true,
                  assetImage: 'assets/images/tkafol_drawer.png',
                  title: 'Tkafol',
                  nextScreen: "CartScreen.routeName",
                ),
                DrawerListTile(
                  isImage: false,
                  icon: Icons.settings,
                  title: 'Settings',
                  nextScreen: SettingsScreen.routeName,
                ),
                DrawerListTile(
                  isImage: true,
                  assetImage: 'assets/images/contact_us_drawer.png',
                  title: 'Contact us',
                  nextScreen: " SettingsScreen.routeName",
                ),
                DrawerListTile(
                  isImage: true,
                  assetImage: "assets/images/about_us_drawer.png",
                  title: 'About us',
                  nextScreen: AboutUsScreen.routeName,
                ),
                DrawerListTile(
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
