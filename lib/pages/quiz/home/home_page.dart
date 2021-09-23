import 'package:flutter/material.dart';

import '../../../data/dummy_data/quest_list.dart';
import '../../../widgets/shared/buttons/custom_button.dart';
import '../../pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void navigateToQuestionsPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const QuestionPage()));
  }

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
        Text(
          "Responda ${questions.length} perguntas e veja sua pontuação no final!",
          style: const TextStyle(
            fontSize: 18,
          ),
          textAlign: TextAlign.justify,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: CustomButtom(
            onPressed: () => navigateToQuestionsPage(context),
            text: "Start!",
          ),
        ),
      ],
    );
  }
}
