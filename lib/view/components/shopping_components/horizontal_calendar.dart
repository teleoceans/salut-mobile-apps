import 'dart:developer';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salute/constants.dart';

import '../../../data/providers/ui_provider.dart';

class HorizontalCalendar extends StatelessWidget {
  const HorizontalCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return DatePicker(
      DateTime.now(),
      initialSelectedDate: DateTime.now(),
      activeDates:
          Provider.of<UiProvider>(context).deliverNow ? [DateTime.now()] : null,
      selectionColor: Provider.of<UiProvider>(context).deliverNow
          ? kNotUsedColor
          : kPrimaryColor,
      selectedTextColor: Provider.of<UiProvider>(context).deliverNow
          ? kNotUsedColor
          : Colors.white,
      deactivatedColor: Provider.of<UiProvider>(context).deliverNow
          ? kNotUsedColor
          : Colors.white,
      onDateChange: (date) {
        // New date selected
        log(date.toString());
        // setState(() {});
      },
    );
  }
}
