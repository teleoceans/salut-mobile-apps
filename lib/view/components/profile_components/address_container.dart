import 'package:flutter/material.dart';
import 'package:salute/view/screens/profile_screens/no_address_screen.dart';

class AddressContainer extends StatelessWidget {
  const AddressContainer({
    super.key,
    required this.address,
    this.onPressed,
    this.suffixText,
    this.margin,
  });
  final String address;
  final String? suffixText;
  final VoidCallback? onPressed;
  final double? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: margin ?? 16),
      padding: const EdgeInsets.all(12),
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
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Address",
                  style: TextStyle(
                    color: Color.fromARGB(255, 63, 63, 63),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  address,
                  style: const TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, NoAddressScreen.routeName);
            },
            child: Text(
              suffixText ?? "Add",
              style: const TextStyle(
                fontSize: 18,
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
