import 'package:flutter/material.dart';

class GenderWidget extends StatefulWidget {
  const GenderWidget({super.key, this.textColor});
  final Color? textColor;
  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  int currentValue = 0;
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
          Text(
            "Gender",
            style: TextStyle(
              color: widget.textColor ?? Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
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
                "male",
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
                "female",
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
