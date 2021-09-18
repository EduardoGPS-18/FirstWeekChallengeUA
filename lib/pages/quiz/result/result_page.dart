import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
            color: Colors.blue,
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
          "$result/10 Acertos",
          style: const TextStyle(
            fontSize: 32,
          ),
          textAlign: TextAlign.justify,
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            "Tentar novamente",
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
