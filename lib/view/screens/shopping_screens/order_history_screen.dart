import 'package:flutter/material.dart';
import 'package:salute/constants.dart';
import 'package:salute/view/components/registration_components/under_picture_body.dart';

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
          title: const Text(
            "Orders",
            style: kAppBarTitleStyle,
          ),
          bottom: const TabBar(
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
                text: "Ongoing",
              ),
              Tab(
                text: "History",
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
                  const UnderPictureBody(
                    body: 'your Ongoing orders will be placed here',
                    title: 'No orders placed yet!',
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
                  const UnderPictureBody(
                    body: 'your Ongoing orders will be placed here',
                    title: 'No orders placed yet!',
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
