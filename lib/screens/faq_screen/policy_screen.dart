import 'package:flutter/material.dart';
import 'package:salute/components/faq_components/faq_list_view.dart';

import '../../models/question.dart';

class PolicyScreen extends StatelessWidget {
  const PolicyScreen({super.key});
  static const String routeName = "PolicyScreen";
  static const List<Question> questions = [
    Question(
      answer:
          'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis',
      question:
          'I just placed an order, but I’m not sure if you got it. What do I do?',
    ),
    Question(
      answer:
          'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis',
      question:
          'I just placed an order, but I’m not sure if you got it. What do I do?',
    ),
    Question(
      answer:
          'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis',
      question:
          'I just placed an order, but I’m not sure if you got it. What do I do?',
    ),
    Question(
      answer:
          'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis',
      question:
          'I just placed an order, but I’m not sure if you got it. What do I do?',
    ),
    Question(
      answer:
          'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis',
      question:
          'I just placed an order, but I’m not sure if you got it. What do I do?',
    ),
    Question(
      answer:
          'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis',
      question:
          'I just placed an order, but I’m not sure if you got it. What do I do?',
    ),
    Question(
      answer:
          'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis',
      question:
          'I just placed an order, but I’m not sure if you got it. What do I do?',
    )
  ];
  @override
  Widget build(BuildContext context) {
    return const FaqListView(
      title: "Privacy Policy",
      questions: questions,
    );
  }
}
