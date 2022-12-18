import 'package:flutter/material.dart';
import 'package:salute/models/tracking_model.dart';

class TrackingOrder extends StatelessWidget {
  const TrackingOrder({super.key, required this.trackingModel});
  final TrackingModel trackingModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          trackingModel.isActived ? trackingModel.time : "00:00 AM",
          style: TextStyle(
            color: trackingModel.isActived ? Colors.black : Colors.transparent,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Expanded(
          child: Column(
            children: [
              trackingModel.isActived
                  ? const CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.green,
                      child: Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    )
                  : const CircleAvatar(
                      radius: 15,
                      backgroundColor: Color(0xFFCCCCCC),
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.white,
                      ),
                    ),
              const SizedBox(
                height: 3,
              ),
              Container(
                width: trackingModel.isActived ? 2 : 1,
                height: 120,
                color: trackingModel.isActived
                    ? Colors.green
                    : const Color(0xFFCCCCCC),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                trackingModel.title,
                style: TextStyle(
                  color: trackingModel.isActived
                      ? Colors.black
                      : const Color(0xFFCCCCCC),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                trackingModel.subTitle,
                style: TextStyle(
                  color: trackingModel.isActived
                      ? Colors.black
                      : const Color(0xFFCCCCCC),
                  height: 1.4,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
