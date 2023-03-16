import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salute/data/helpers/shared_preferences.dart';
import 'package:salute/data/models/order_status.dart';
import 'package:salute/data/providers/auth_provider.dart';
import 'package:salute/data/providers/products_provider.dart';
import 'package:salute/data/providers/shopping_provider.dart';
import 'package:salute/view/components/shopping_components/recieved_order_container.dart';
import 'package:salute/view/components/shopping_components/tracking_component.dart';
import 'package:salute/constants.dart';
import 'package:salute/data/models/tracking_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({super.key});
  static const String routeName = "TrackOrderScreen";

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  bool isLoading = false;
  bool isSuccess = true;
  OrderStatus? orderStatus;
  ProductsProvider? lastOrderProvider;
  bool first = true;
  Future<void> getLastOrderStatus() async {
    isSuccess = true;
    setState(() {
      isLoading = true;
    });
    if (!Provider.of<ProductsProvider>(context, listen: false)
        .isLastOrderCalled) {
      String token =
          Provider.of<AuthProvider>(context, listen: false).authToken;
      int id = await SharedPreferencesHelper.getLastOrderId();
      // ignore: use_build_context_synchronously
      await lastOrderProvider!
          .getLastOrder(
        token: token,
        id: id,
      )
          .then((value) {
        lastOrderProvider!.setIsLastOrderCalled = true;
        orderStatus = lastOrderProvider!.orderStatus;
        setState(() {
          isLoading = false;
        });
      });
    }
  }

  @override
  void didChangeDependencies() {
    if (first) {
      lastOrderProvider = Provider.of<ProductsProvider>(context, listen: false);
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    lastOrderProvider!.setIsLastOrderCalled = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Provider.of<ShoppingProvider>(context, listen: false)
            .setIsTrackingOrder = false;
        return true;
      },
      child: FutureBuilder(
          future: getLastOrderStatus(),
          builder: (context, snapshot) {
            return snapshot.connectionState == ConnectionState.waiting
                ?  Scaffold(
                    appBar: AppBar(
                title: Text(
                  '${AppLocalizations.of(context)!.track_order}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
                elevation: 0,
                backgroundColor: Colors.transparent,
                leading: kArrowBack(context),
              ),
                    body: kCircularLoadingProgress,
                  )
                : orderStatus == null
                    ?   Scaffold(
                        appBar: AppBar(
                title: Text(
                  '${AppLocalizations.of(context)!.track_order}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
                elevation: 0,
                backgroundColor: Colors.transparent,
                leading: kArrowBack(context),
              ),
                        body: Center(
                          child: Text(
                           "${AppLocalizations.of(context)!.mass_order3}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      )
                    : Scaffold(
                        appBar: AppBar(
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          leading: kArrowBack(context),
                          title:   Text(
                            "${AppLocalizations.of(context)!.delivery_status}",
                            style: kAppBarTitleStyle,
                          ),
                        ),
                        body: SafeArea(
                          child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  Text(
                                    orderStatus!.dateString,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                      ),
                                      children: [
                                          TextSpan(text: "${AppLocalizations.of(context)!.number_order}",
                                     ),
                                        TextSpan(
                                          text: ' #${orderStatus!.id}',
                                          style: const TextStyle(
                                              color: kPrimaryColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Expanded(
                                    child: ListView(
                                      children: [
                                        TrackingOrder(
                                          trackingModel: TrackingModel(
                                              isActived: orderStatus!.statusId >= 1,
                                              time: "${orderStatus!.pendingTime}",
                                              title: "${AppLocalizations.of(context)!.pending}",
                                              subTitle: "${AppLocalizations.of(context)!.consectetur}",
                                                  ),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        TrackingOrder(
                                          trackingModel: TrackingModel(
                                              isActived:
                                                  orderStatus!.statusId >= 2,
                                              time: "00:00 AM",
                                              title: "${AppLocalizations.of(context)!.confirmed}",
                                              subTitle:
                                              "${AppLocalizations.of(context)!.consectetur}",
                                             ),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        TrackingOrder(
                                          trackingModel: TrackingModel(
                                              isActived:
                                                  orderStatus!.statusId >= 3,
                                              time: "00:00 AM",
                                              title: "${AppLocalizations.of(context)!.out_delivery}",
                                              subTitle: "${AppLocalizations.of(context)!.consectetur}",
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        TrackingOrder(
                                          trackingModel: TrackingModel(
                                              isActived:
                                                  orderStatus!.statusId >= 4,
                                              time: "00:00 AM",
                                              title: "${AppLocalizations.of(context)!.delived}",
                                              subTitle:"${AppLocalizations.of(context)!.consectetur}",
                                                  ),
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        const RecievedOrderContainer(),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                ],
                              )),
                        ),
                      );
          }),
    );
  }
}
