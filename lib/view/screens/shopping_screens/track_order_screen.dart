import 'package:flutter/material.dart';
import 'package:salute/view/components/default_button.dart';
import 'package:salute/view/components/shopping_components/recieved_order_container.dart';
import 'package:salute/view/components/shopping_components/tracking_component.dart';
import 'package:salute/constants.dart';
import 'package:salute/data/models/tracking_model.dart';
import 'package:salute/view/screens/shopping_screens/cancel_order_screen.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});
  static const String routeName = "TrackOrderScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
            color: kPrimaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Delivery Status",
          style: TextStyle(
            color: Color(0xFF666666),
            fontSize: 21,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                "Estimated Delivery",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                "17 Oct, 2022 / 1:30 PM",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                  children: [
                    TextSpan(text: 'Order Number'),
                    TextSpan(
                      text: ' #510',
                      style: TextStyle(color: kPrimaryColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView(
                  children: const [
                    TrackingOrder(
                      trackingModel: TrackingModel(
                          isActived: true,
                          time: "00:00 AM",
                          title: "title",
                          subTitle:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit."),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    TrackingOrder(
                      trackingModel: TrackingModel(
                          isActived: true,
                          time: "00:00 AM",
                          title: "title",
                          subTitle:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit."),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    TrackingOrder(
                      trackingModel: TrackingModel(
                          isActived: true,
                          time: "00:00 AM",
                          title: "title",
                          subTitle:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit."),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    TrackingOrder(
                      trackingModel: TrackingModel(
                          isActived: true,
                          time: "00:00 AM",
                          title: "title",
                          subTitle:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit."),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    RecievedOrderContainer(),
                    SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Expanded(
                    child: DefaultButton(
                      backgroundColor: Colors.transparent,
                      textColor: kPrimaryColor,
                      borderColor: kPrimaryColor,
                      text: "Cancel Order",
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: const Text(
                              "Are you sure you want to cancel your order ?",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            actions: [
                              Row(
                                children: [
                                  Expanded(
                                    child: DefaultButton(
                                      margin: 4,
                                      text: "Yes",
                                      textColor: kPrimaryColor,
                                      backgroundColor: Colors.transparent,
                                      onTap: () {
                                        Navigator.pushNamed(context,
                                            CancelOrderScreen.routeName);
                                      },
                                    ),
                                  ),
                                  Expanded(
                                      child: DefaultButton(
                                    margin: 4,
                                    text: "No",
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ))
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: DefaultButton(
                      text: "Edit Order",
                      onTap: () {
                        int count = 0;
                        Navigator.popUntil(context, (_) => count++ >= 2);
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
