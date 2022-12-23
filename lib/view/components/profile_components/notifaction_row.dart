import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationRow extends StatefulWidget {
  const NotificationRow({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  State<NotificationRow> createState() => _NotificationRowState();
}

class _NotificationRowState extends State<NotificationRow> {
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
      trailing: CupertinoSwitch(
        activeColor: Colors.green,
        value: _isClicked,
        onChanged: (value) {
          setState(() {
            _isClicked = value;
          });
        },
      ),
    );
  }
}
