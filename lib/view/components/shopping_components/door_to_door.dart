import 'package:flutter/material.dart';

class DoorToDoor extends StatelessWidget {
  const DoorToDoor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
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
        children: const [
          CircleAvatar(
            backgroundColor: Colors.green,
            radius: 15,
            child: Center(
              child: Icon(
                Icons.check,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 22,
          ),
          Text(
            "Door to door",
            style: TextStyle(
              color: Color.fromARGB(255, 63, 63, 63),
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
