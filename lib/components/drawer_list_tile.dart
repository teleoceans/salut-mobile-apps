import 'package:flutter/material.dart';
import 'package:salute/constants.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    this.icon,
    required this.title,
    this.themeColor,
    required this.nextScreen,
    required this.isImage,
    this.assetImage,
  });
  final IconData? icon;
  final String title;
  final Color? themeColor;
  final String nextScreen;
  final bool isImage;
  final String? assetImage;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.pushNamed(context, nextScreen),
      leading: IconButton(
        iconSize: 30,
        onPressed: () {},
        icon: isImage
            ? Image.asset(assetImage!)
            : Icon(
                icon,
                color: themeColor ?? kPrimaryColor,
              ),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: themeColor ?? Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}
