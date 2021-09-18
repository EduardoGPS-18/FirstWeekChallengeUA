import 'package:flutter/material.dart';
import 'package:perguntados/pages/pages.dart';
import 'package:perguntados/widgets/shared/buttons/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageWithCenterCard(
      children: [
        const Text(
          "Perguntas e respostas",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.blue,
          ),
        ),
        const Text(
          "Responda 10 perguntas e veja sua pontuação no final!",
          style: TextStyle(
            fontSize: 18,
          ),
          textAlign: TextAlign.justify,
        ),
        LayoutBuilder(
          builder: (ctx, constraints) => SizedBox(
            width: constraints.maxWidth,
            child: CustomButtom(
              onPressed: () {},
              text: "Start!",
            ),
          ),
        ),
      ],
    );
  }
}