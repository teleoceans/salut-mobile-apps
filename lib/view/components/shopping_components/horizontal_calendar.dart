import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salute/constants.dart';

import '../../../data/providers/products_provider.dart';

class HorizontalCalendar extends StatelessWidget {
  const HorizontalCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return DatePicker(
      DateTime.now(),
      initialSelectedDate: DateTime.now(),
      activeDates: Provider.of<ProductsProvider>(context).wantsNow
          ? [DateTime.now()]
          : null,
      selectionColor: Provider.of<ProductsProvider>(context)
              .wantsNow
             
          ? kNotUsedColor
          : kPrimaryColor,
      selectedTextColor: Provider.of<ProductsProvider>(context).wantsNow
          ? kNotUsedColor
          : Colors.white,
      deactivatedColor: Provider.of<ProductsProvider>(context).wantsNow
          ? kNotUsedColor
          : Colors.white,
      onDateChange: (date) {
        // New date selected
        Provider.of<ProductsProvider>(context, listen: false)
            .addDateAndTime(date.toIso8601String());

        // setState(() {});
      },
    );
  }
}
