import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salute/data/helpers/shared_preferences.dart';
import 'package:salute/data/models/address.dart';
import 'package:salute/data/providers/addresses_provider.dart';
import 'package:salute/view/components/default_button.dart';
import 'package:salute/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});
  static const String routeName = "AddAddressScreen";

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  int? addressId;
  Address? thisAddress;
  final TextEditingController streetNameController = TextEditingController();
  final TextEditingController buildingNameController = TextEditingController();
  final TextEditingController floorNumberController = TextEditingController();
  final TextEditingController addressNameController = TextEditingController();
  final TextEditingController landmarkController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController landlineNumberController =
      TextEditingController();
  final TextEditingController apartmentNumberController =
      TextEditingController();
  bool firstTime = true;
  void setValues() {}

  bool isLoading = false;
  bool isSuccess = true;
  void addAddress() async {
    setState(() {
      isLoading = true;
    });
    isSuccess = true;

    await Provider.of<AddressesProvider>(context, listen: false)
        .addAddress(
      addressName: addressNameController.text,
      apartmentNumber: apartmentNumberController.text,
      buildingNumber: buildingNameController.text,
      floorNumber: floorNumberController.text,
      buildingType: const BuildingType(buildingType: 'office', id: 0),
      nearbyLandmark: landmarkController.text,
      streetName: streetNameController.text,
      area: const Area(id: 1, areaName: 'Giza'),
      token: await SharedPreferencesHelper.getSavedUser(),
    )
        .catchError((error) {
      log("error");
      log(error);
      isSuccess = false;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Something went wrong, please try again later"),
        ),
      );
      setState(() {
        isLoading = false;
      });
    }).then((value) {
      setState(() {
        isLoading = false;
      });
      if (isSuccess) {
        Navigator.pop(context);
      }
    });
  }

  void updateAddress() async {
    isSuccess = true;
    setState(() {
      isLoading = true;
    });
    Provider.of<AddressesProvider>(context, listen: false)
        .updateAddress(
      id: addressId!,
      addressName: addressNameController.text,
      apartmentNumber: apartmentNumberController.text,
      buildingNumber: buildingNameController.text,
      floorNumber: floorNumberController.text,
      buildingType: const BuildingType(buildingType: 'office', id: 0),
      nearbyLandmark: landmarkController.text,
      streetName: streetNameController.text,
      area: const Area(id: 1, areaName: 'Giza'),
      token: await SharedPreferencesHelper.getSavedUser(),
    )
        .catchError((_) {
      isSuccess = false;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Something went wrong, please try again later"),
        ),
      );
      setState(() {
        isLoading = false;
      });
    }).then((value) {
      setState(() {
        isLoading = false;
      });
      if (isSuccess) {
        Navigator.pop(context);
      }
    });
  }

  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) {
      if (ModalRoute.of(context)!.settings.arguments != null) {
        addressId = ModalRoute.of(context)!.settings.arguments as int;
        thisAddress = Provider.of<AddressesProvider>(context, listen: false)
            .findAddressById(addressId!);
        streetNameController.text = thisAddress!.streetName;
        buildingNameController.text = thisAddress!.buildNumber;
        floorNumberController.text = thisAddress!.floorNumber;
        addressNameController.text = thisAddress!.addressName;
        landmarkController.text = thisAddress!.nearbyLandmark;
        apartmentNumberController.text = thisAddress!.apartmentNumber;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: kArrowBack(context),
        title:  Text(
          "${AppLocalizations.of(context)!.add_addresses}",
          style: kAppBarTitleStyle,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  AreaRadioWidget(
                    intialValue: thisAddress == null ? 0 : thisAddress!.area.id,
                    textColor: Colors.black,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 1,
                    color: Colors.grey,
                    width: double.infinity,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                    Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "${AppLocalizations.of(context)!.street}",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      controller: streetNameController,
                      style: const TextStyle(color: Colors.black),
                      decoration:  InputDecoration(
                        hintText: "${AppLocalizations.of(context)!.type_here}",
                        // alignLabelWithHint: true,
                        labelStyle: TextStyle(color: Colors.black),
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 1,
                    color: Colors.grey,
                    width: double.infinity,
                  ),
                  BuildingTypeWidget(
                    initalValue:
                        thisAddress == null ? 0 : thisAddress!.buildingType.id,
                    textColor: Colors.black,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 1,
                    color: Colors.grey,
                    width: double.infinity,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                    Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "${AppLocalizations.of(context)!.building}",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      controller: buildingNameController,
                      style: const TextStyle(color: Colors.black),
                      decoration:   InputDecoration(
                        hintText:  "${AppLocalizations.of(context)!.type_here}",
                        // alignLabelWithHint: true,
                        labelStyle: TextStyle(color: Colors.black),
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 1,
                    color: Colors.grey,
                    width: double.infinity,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                    Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                     "${AppLocalizations.of(context)!.floor}",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      controller: floorNumberController,
                      style: const TextStyle(color: Colors.black),
                      decoration:  InputDecoration(
                        hintText:  "${AppLocalizations.of(context)!.type_here}",
                        labelStyle: TextStyle(color: Colors.black),
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 1,
                    color: Colors.grey,
                    width: double.infinity,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                    Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                    "${AppLocalizations.of(context)!.apartment}",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      controller: apartmentNumberController,
                      style: const TextStyle(color: Colors.black),
                      decoration:  InputDecoration(
                        hintText: "${AppLocalizations.of(context)!.type_here}",
                        labelStyle: TextStyle(color: Colors.black),
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 1,
                    color: Colors.grey,
                    width: double.infinity,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                    Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "${AppLocalizations.of(context)!.name_addresses}",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      controller: addressNameController,
                      style: const TextStyle(color: Colors.black),
                      decoration:   InputDecoration(
                        hintText:"${AppLocalizations.of(context)!.type_here}",

                        // alignLabelWithHint: true,
                        labelStyle: TextStyle(color: Colors.black),
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 1,
                    color: Colors.grey,
                    width: double.infinity,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                    Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "${AppLocalizations.of(context)!.landmark}",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      controller: landmarkController,
                      style: const TextStyle(color: Colors.black),
                      decoration:   InputDecoration(
                        hintText: "${AppLocalizations.of(context)!.type_here}",

                        // alignLabelWithHint: true,
                        labelStyle: TextStyle(color: Colors.black),
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 1,
                    color: Colors.grey,
                    width: double.infinity,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                    Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "${AppLocalizations.of(context)!.number}",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      controller: phoneNumberController,
                      style: const TextStyle(color: Colors.black),
                      decoration:   InputDecoration(
                        hintText: "${AppLocalizations.of(context)!.type_here}",

                        // alignLabelWithHint: true,
                        labelStyle: TextStyle(color: Colors.black),
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 1,
                    color: Colors.grey,
                    width: double.infinity,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                    Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "${AppLocalizations.of(context)!.landline}",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      controller: landlineNumberController,
                      style: const TextStyle(color: Colors.black),
                      decoration:   InputDecoration(
                        hintText:"${AppLocalizations.of(context)!.type_here}",

                        // alignLabelWithHint: true,
                        labelStyle: TextStyle(color: Colors.black),
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            isLoading
                ? kCircularLoadingProgress
                : DefaultButton(
                    margin: 16,
                    text:  "${AppLocalizations.of(context)!.saved_addresses}",
                    onTap: () {
                      if (addressId != null) {
                        updateAddress();
                      } else {
                        addAddress();
                      }
                    },
                  ),
          ],
        ),
      ),
    );
  }
}

class AreaRadioWidget extends StatefulWidget {
  const AreaRadioWidget({super.key, this.textColor, this.intialValue});
  final Color? textColor;
  final int? intialValue;
  @override
  State<AreaRadioWidget> createState() => _AreaRadioWidget();
}

class _AreaRadioWidget extends State<AreaRadioWidget> {
  int? currentValue = 0;
  bool firstTime = true;

  @override
  Widget build(BuildContext context) {
    if (firstTime) {
      currentValue = widget.intialValue;
      firstTime = false;
    }
    return Theme(
      data: ThemeData().copyWith(
        unselectedWidgetColor: widget.textColor ?? Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 12,
          ),
            Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "${AppLocalizations.of(context)!.area}",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
          ),
          Row(
            children: [
              Radio(
                  activeColor: Colors.green,
                  focusColor: Colors.green,
                  value: 0,
                  groupValue: currentValue,
                  onChanged: (value) {
                    setState(() {
                      currentValue = value!;
                    });
                  }),
              Text(
                "${AppLocalizations.of(context)!.october}",
                style: TextStyle(
                  color: widget.textColor ?? Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Radio(
                  activeColor: Colors.green,
                  focusColor: Colors.green,
                  value: 1,
                  groupValue: currentValue,
                  onChanged: (value) {
                    setState(() {
                      currentValue = value!;
                    });
                  }),
              Text(
               "${AppLocalizations.of(context)!.zayed}",
                style: TextStyle(
                  color: widget.textColor ?? Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BuildingTypeWidget extends StatefulWidget {
  const BuildingTypeWidget({super.key, this.textColor, this.initalValue});
  final Color? textColor;
  final int? initalValue;
  @override
  State<BuildingTypeWidget> createState() => _BuildingTypeWidget();
}

class _BuildingTypeWidget extends State<BuildingTypeWidget> {
  int? currentValue;
  @override
  void initState() {
    currentValue = widget.initalValue!;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(
        unselectedWidgetColor: widget.textColor ?? Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 12,
          ),
            Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "${AppLocalizations.of(context)!.building_type}",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
          ),
          Row(
            children: [
              Radio(
                  activeColor: Colors.green,
                  focusColor: Colors.green,
                  value: 0,
                  groupValue: currentValue,
                  onChanged: (value) {
                    setState(() {
                      currentValue = value!;
                    });
                  }),
              Text(
                "${AppLocalizations.of(context)!.apartmenta}",
                style: TextStyle(
                  color: widget.textColor ?? Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Radio(
                  activeColor: Colors.green,
                  focusColor: Colors.green,
                  value: 1,
                  groupValue: currentValue,
                  onChanged: (value) {
                    setState(() {
                      currentValue = value!;
                    });
                  }),
              Text(
                "${AppLocalizations.of(context)!.villa}",
                style: TextStyle(
                  color: widget.textColor ?? Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Radio(
                  activeColor: Colors.green,
                  focusColor: Colors.green,
                  value: 2,
                  groupValue: currentValue,
                  onChanged: (value) {
                    setState(() {
                      currentValue = value!;
                    });
                  }),
              Text(
                "${AppLocalizations.of(context)!.office}",
                style: TextStyle(
                  color: widget.textColor ?? Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
