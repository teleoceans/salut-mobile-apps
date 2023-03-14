import 'package:animate_icons/animate_icons.dart';
import 'package:flutter/material.dart';

import '../../../data/models/question.dart';

class QuestionTile extends StatefulWidget {
  const QuestionTile(this.question, {Key? key}) : super(key: key);
  final Question question;

  @override
  State<QuestionTile> createState() => _QuestionTileState();
}

class _QuestionTileState extends State<QuestionTile> {
  final AnimateIconController _controller = AnimateIconController();
  bool _isOpened = false;
  void _toggleContainer() {
    setState(() {
      _isOpened = !_isOpened;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 200,
      ),
      height: _isOpened ? 150 : 50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              
              Expanded(
                child: Text(
                  widget.question.question,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    height: 1.2,
                  ),
                ),
              ),
              AnimateIcons(
                startIcon: Icons.arrow_drop_down_circle_outlined,
                endIcon: Icons.arrow_circle_up,
                size: 30,
                controller: _controller,
                onStartIconPress: () {
                  _toggleContainer();
                  return true;
                },
                onEndIconPress: () {
                  _toggleContainer();
                  return true;
                },
                duration: const Duration(milliseconds: 200),
                startIconColor: Colors.black,
                endIconColor: Colors.black,
                clockwise: false,
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: SingleChildScrollView(
                child: Text(
                  widget.question.answer,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
