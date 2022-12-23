import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salute/constants.dart';
import 'package:salute/view/components/profile_components/notification_list_view.dart';

import '../../../data/providers/ui_provider.dart';

class NotifictaionScreen extends StatelessWidget {
  const NotifictaionScreen({super.key});
  static const String routeName = "NotifictaionScreen";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            color: Colors.transparent,
            child: SafeArea(
              child: Column(
                children: const [
                  Expanded(child: SizedBox()),
                  TabBar(
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.black,
                    indicatorColor: kPrimaryColor,
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    tabs: [
                      Tab(text: "All"),
                      Tab(text: "Discounts"),
                      Tab(text: "Announcements"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            NotifcationListView(
              notifications: Provider.of<UiProvider>(context, listen: false)
                  .allNotifications,
            ),
            NotifcationListView(
              notifications: Provider.of<UiProvider>(context, listen: false)
                  .discountsNotificationList,
            ),
            NotifcationListView(
              notifications: Provider.of<UiProvider>(context, listen: false)
                  .announcementsNotificationList,
            ),
          ],
        ),
      ),
    );
  }
}
