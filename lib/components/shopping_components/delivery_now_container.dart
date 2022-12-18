import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                children: const [
                  Icon(
                    FontAwesomeIcons.boltLightning,
                    size: 18,
                    color: Color(0xFFFFD600),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Lightning Delivery",
                    style: TextStyle(
                      color: Color.fromARGB(255, 63, 63, 63),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "        20 mins to your doorstep",
                style: TextStyle(color: Color(0xFF666666)),
              )
            ],
          ),
          const CircleAvatar(
            radius: 15,
            backgroundColor: Colors.black,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 14.5,
            ),
          )
        ],
      ),
    );
  }
}
