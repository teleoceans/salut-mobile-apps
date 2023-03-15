import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:salute/constants.dart';
import 'package:salute/data/providers/products_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeliveryNowContainer extends StatelessWidget {
  const DeliveryNowContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
            spreadRadius: 3,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Icon(
                    FontAwesomeIcons.boltLightning,
                    size: 18,
                    color: Provider.of<ProductsProvider>(context).wantsNow
                        ? const Color(0xFFFFD600)
                        : kNotUsedColor,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "${AppLocalizations.of(context)!.delivery_li}",
                    style: TextStyle(
                      color: Provider.of<ProductsProvider>(context).wantsNow
                          ? const Color.fromARGB(255, 63, 63, 63)
                          : kNotUsedColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "${AppLocalizations.of(context)!.doorstep}",
                style: TextStyle(
                    color: Provider.of<ProductsProvider>(context).wantsNow
                        ? const Color(0xFF666666)
                        : kNotUsedColor),
              )
            ],
          ),
          GestureDetector(
            onTap: () {
              if (!Provider.of<ProductsProvider>(context, listen: false)
                  .wantsNow) {
                Provider.of<ProductsProvider>(context, listen: false)
                    .toggleDeliverStatus();
                Provider.of<ProductsProvider>(context, listen: false)
                    .setDeliveryMethond = "deliver now";
              }
            },
            child: Provider.of<ProductsProvider>(context).wantsNow
                ? const CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 15,
                    child: Center(
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                    ),
                  )
                : const CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 14.5,
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
