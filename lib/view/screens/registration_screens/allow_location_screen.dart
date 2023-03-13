import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:salute/main.dart';
import 'package:location/location.dart';

import '../../components/default_button.dart';
import '../../components/registration_components/under_picture_body.dart';
import '../../../constants.dart';
import 'dart:io' show Platform;

import 'order_anywhere_screen.dart';
// TODO: Delete this location screen
class AllowLocationScreen extends StatefulWidget {
  const AllowLocationScreen({super.key});
  static const String routeName = "AllowLocationScreen";

  @override
  State<AllowLocationScreen> createState() => _AllowLocationScreenState();
}

class _AllowLocationScreenState extends State<AllowLocationScreen> {
  Future<void> _getLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    log(locationData.latitude.toString());
    log(locationData.longitude.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: 32,
            left: 16,
            right: Platform.isAndroid ? 16 : 0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.2,
                child: Image.asset("assets/images/share_location.png"),
              ),
              const Spacer(),
              const UnderPictureBody(
                body:
                    "Please enable location access so we could provide you with accurate results",
                title: "Share Location",
              ),
              const Spacer(),
              DefaultButton(
                margin: 60,
                text: "Allow",
                backgroundColor: kPrimaryColor,
                onTap: () async {
                  await _getLocation().then(
                    (value) => Navigator.pushNamed(
                      context,
                      OrderAnywhereScreen.routeName,
                    ),
                  );
                },
              ),
              TextButton(
                onPressed: () => kReplaceAllCurrentScreens(context,
                    routeName: MyHomePage.routeName),
                child: const Text(
                  "Skip",
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
