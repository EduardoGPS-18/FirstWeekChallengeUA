import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/dummy_data/quest_list.dart';
import '../../../widgets/question/header_question.dart';
import '../../../widgets/question/response_button.dart';
import '../../../widgets/shared/appbar/custom_app_bar.dart';
import '../../../widgets/shared/buttons/custom_button.dart';
import '../../pages.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int currentPage = 0;
  List<int> responses = List.filled(questions.length, -1);
  List<bool> isConfirmed = List.filled(questions.length, false);
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            setState(() {
              currentPage - 1 >= 0 ? currentPage-- : Navigator.pop(context);
            });
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: [
                HeaderQuestion(
                  constraints: constraints,
                  title: questions[currentPage].title,
                ),
                SizedBox(
                  height: constraints.maxHeight * 58 / 100,
                  child: LayoutBuilder(
                    builder: (context, constraints) => ListView.separated(
                      separatorBuilder: (ctx, i) => SizedBox(
                        height: constraints.maxHeight * 2 / 100,
                      ),
                      itemCount: 4,
                      itemBuilder: (ctx, currentIndex) => ResponseButton(
                        constraints: constraints,
                        isRight: questions[currentPage].correctIndex == currentIndex,
                        selected: responses[currentPage] == currentIndex,
                        isConfirmed: isConfirmed[currentPage],
                        onChange: isConfirmed[currentPage]
                            ? (_) {}
                            : (_) {
                                setState(() {
                                  responses[currentPage] = currentIndex;
                                });
                              },
                        titleResponse: questions[currentPage].listTitleResult[currentIndex],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 3 / 100,
                ),
                SizedBox(
                  width: constraints.maxWidth,
                  child: CustomButtom(
                    text: isConfirmed[currentPage] ? "Proxima pergunta" : "Responder",
                    onPressed: responses[currentPage] == -1
                        ? null
                        : isConfirmed[currentPage]
                            ? currentPage + 1 > questions.length - 1
                                ? () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => ResultPage(result: score)));
                                  }
                                : () {
                                    setState(() {
                                      currentPage++;
                                    });
                                  }
                            : () {
                                setState(() {
                                  score = questions[currentPage].correctIndex == responses[currentPage] ? score + 1 : score + 0;
                                  isConfirmed[currentPage] = true;
                                });
                              },
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 3 / 100,
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
