import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salute/constants.dart';
import 'package:salute/data/providers/notifications_provider.dart';
import 'package:salute/view/components/profile_components/notification_list_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class NotifictaionScreen extends StatefulWidget {
  const NotifictaionScreen({super.key});
  static const String routeName = "NotifictaionScreen";

  @override
  State<NotifictaionScreen> createState() => _NotifictaionScreenState();
}

class _NotifictaionScreenState extends State<NotifictaionScreen> {
  Future<void> loadData() async {
    if (!Provider.of<NotificationProvider>(context, listen: false).isCalled) {
      await Provider.of<NotificationProvider>(context, listen: false)
          .fetchNotifications()
          .then((value) {
        Provider.of<NotificationProvider>(context, listen: false).setIsCalled =
            true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Provider.of<NotificationProvider>(context, listen: false)
                  .seeAllNotificaitons();
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          bottom:   TabBar(
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.black,
            indicatorColor: kPrimaryColor,
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            tabs: [
              Tab(text: "${AppLocalizations.of(context)!.all}"),
              Tab(text: "${AppLocalizations.of(context)!.discounts}"),
              Tab(text: "${AppLocalizations.of(context)!.announcements}"),
            ],
          ),
        ),
        body: FutureBuilder(
            future: loadData(),
            builder: (context, snapshot) {
              return TabBarView(
                children: [
                  snapshot.connectionState == ConnectionState.waiting
                      ? kCircularLoadingProgress
                      : NotifcationListView(
                          notifications: Provider.of<NotificationProvider>(
                                  context,
                                  listen: false)
                              .allNotifications,
                        ),
                  NotifcationListView(
                    notifications: Provider.of<NotificationProvider>(context,
                            listen: false)
                        .discountNotification,
                  ),
                  NotifcationListView(
                    notifications: Provider.of<NotificationProvider>(context,
                            listen: false)
                        .announcementNotifications,
                  ),
                ],
              );
            }),
      ),
    );
  }
}
