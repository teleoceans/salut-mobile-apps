import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';

class TimePeriodRow extends StatefulWidget {
  const TimePeriodRow({super.key});

  @override
  State<TimePeriodRow> createState() => _TimePeriodRowState();
}

class _TimePeriodRowState extends State<TimePeriodRow> {
  String time = "";
  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: kPrimaryColor, // <-- SEE HERE
                onPrimary: Colors.white, // <-- SEE HERE
                onSurface: Colors.black, // <-- SEE HERE
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(),
              ),
            ),
            child: child!,
          ),
        );
      },
      context: context,
    );
    if (picked != null) {
      // ignore: use_build_context_synchronously
      var dt = DateFormat("h:mm").parse(picked.format(context));
      var finaltime = DateFormat('HH:mma').format(dt);
      setState(() {
        time = finaltime.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: _selectTime,
          child: const Text(
            "Time Period",
            style: TextStyle(
              color: Color.fromARGB(255, 20, 20, 20),
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const Spacer(),
        Text(
          time,
          style: const TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
