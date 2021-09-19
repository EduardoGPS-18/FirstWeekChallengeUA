import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets/question/header_question.dart';
import '../../../widgets/question/response_button.dart';
import '../../../widgets/shared/appbar/custom_app_bar.dart';
import '../../../widgets/shared/buttons/custom_button.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int currentPage = 0;
  List<int> responses = List.filled(10, -1);
  List<bool> selectedIndexOfCurrentPage = List.filled(4, false);
  List<bool> isConfirmed = List.filled(10, false);
  List<ResponseButton> buttons = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: [
                HeaderQuestion(
                  constraints: constraints,
                  title: "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum  Lorem ipsum Lorem ipsum ",
                ),
                SizedBox(
                  height: constraints.maxHeight * 58 / 100,
                  child: LayoutBuilder(
                    builder: (context, constraints) => ListView.separated(
                      separatorBuilder: (ctx, i) => SizedBox(
                        height: constraints.maxHeight * 2 / 100,
                      ),
                      itemCount: 4,
                      itemBuilder: (ctx, currentIndex) {
                        ResponseButton currentButton = ResponseButton(
                          constraints: constraints,
                          isRight: currentIndex == 3,
                          selected: selectedIndexOfCurrentPage[currentIndex],
                          isConfirmed: isConfirmed[currentPage],
                          onChange: isConfirmed[currentPage]
                              ? (v) {}
                              : (val) {
                                  setState(() {
                                    for (int i = 0; i < selectedIndexOfCurrentPage.length; i++) {
                                      selectedIndexOfCurrentPage[i] = false;
                                    }

                                    selectedIndexOfCurrentPage[currentIndex] = true;
                                    responses[currentPage] = currentIndex;
                                  });
                                },
                        );
                        buttons.add(currentButton);
                        return currentButton;
                      },
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
                            ? () {}
                            : () {
                                setState(() {
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
