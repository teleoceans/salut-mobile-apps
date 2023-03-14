import 'package:flutter/material.dart';
import 'package:salute/view/components/faq_components/question_tile.dart';
import 'package:salute/constants.dart';

import '../../../data/models/question.dart';

class FaqListView extends StatelessWidget {
  const FaqListView({Key? key, required this.questions, required this.title})
      : super(key: key);
  final List<Question> questions;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: kAppBarTitleStyle,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: kArrowBack(context),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) => QuestionTile(questions[index]),

                // ),
              ),
            ),
            Image.asset(
              'assets/images/salut_text_ black.png',
              width: 80,
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "version 1.00.1",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
