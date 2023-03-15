import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salute/data/providers/auth_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            "${AppLocalizations.of(context)!.gender}",
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
                    Provider.of<AuthProvider>(context, listen: false)
                        .setGender = "Male";
                    setState(() {
                      currentValue = value!;
                    });
                  }),
              Text(
                "${AppLocalizations.of(context)!.male}",
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
                    Provider.of<AuthProvider>(context, listen: false)
                        .setGender = "Female";
                    setState(() {
                      currentValue = value!;
                    });
                  }),
              Text(
                 "${AppLocalizations.of(context)!.female}",
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
