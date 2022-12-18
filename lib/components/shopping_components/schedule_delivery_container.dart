import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salute/components/shopping_components/horizontal_calendar.dart';
import 'package:salute/components/shopping_components/time_period_row.dart';
import 'package:salute/constants.dart';

class ScheduleDeliveryContainer extends StatelessWidget {
  const ScheduleDeliveryContainer({super.key});

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
      child: Column(
        children: [
          Row(
            children: const [
              Icon(
                FontAwesomeIcons.clock,
                size: 20,
                color: kPrimaryColor,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "Scheduale for later",
                style: TextStyle(
                  color: Color.fromARGB(255, 63, 63, 63),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Spacer(),
              CircleAvatar(
                radius: 15,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 14.5,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          const HorizontalCalendar(),
          const SizedBox(
            height: 12,
          ),
          const TimePeriodRow(),
        ],
      ),
    );
  }
}
