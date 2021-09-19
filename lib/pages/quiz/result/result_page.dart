import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../data/dummy_data/quest_list.dart';
import '../../pages.dart';

class ResultPage extends StatelessWidget {
  final int result;
  const ResultPage({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageWithCenterCard(
      children: [
        const Text(
          "Perguntas e respostas",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: Color(0xff758CFF),
          ),
        ),
        const Text(
          "Sua pontuação foi de:",
          style: TextStyle(
            fontSize: 18,
          ),
          textAlign: TextAlign.justify,
        ),
        Text(
          "$result/${questions.length} Acertos",
          style: const TextStyle(
            fontSize: 32,
          ),
          textAlign: TextAlign.justify,
        ),
        TextButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const HomePage()), (route) => false);
          },
          child: const Text(
            "Tentar novamente",
            style: TextStyle(decoration: TextDecoration.underline, fontSize: 18, color: Color(0xff758CFF)),
          ),
        ),
      ],
    );
  }
}
