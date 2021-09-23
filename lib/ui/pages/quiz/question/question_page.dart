import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../data/dummy_data/quest_list.dart';
import '../../../widgets/question/question.dart';
import '../../../widgets/shared/shared_widgets.dart';
import '../../pages.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  late final PageController _pageController;
  final List<int> responses = List.filled(questions.length, -1);
  final List<bool> isConfirmed = List.filled(questions.length, false);
  int score = 0;

  @override
  void initState() {
    _pageController = PageController();

    super.initState();
  }

  void navigateToPreviousPage() {
    setState(() {
      if (_pageController.page!.toInt() - 1 >= 0) {
        _pageController.animateToPage(
          _pageController.page!.toInt() - 1,
          duration: const Duration(milliseconds: 500),
          curve: Curves.decelerate,
        );
      } else {
        Navigator.pop(context);
      }
    });
  }

  void navigateToNextOrResultPage() {
    if (_pageController.page!.toInt() + 1 > questions.length - 1) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => ResultPage(result: score)));
    } else {
      _pageController.animateToPage(_pageController.page!.toInt() + 1, duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
    }
  }

  void setResponse(int currentIndex) {
    setState(() {
      responses[_pageController.page!.toInt()] = currentIndex;
    });
  }

  void confirmQuestion() {
    setState(
      () {
        score = questions[_pageController.page!.toInt()].correctIndex == responses[_pageController.page!.toInt()] ? score + 1 : score + 0;
        isConfirmed[_pageController.page!.toInt()] = true;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: navigateToPreviousPage,
        ),
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          for (int currentPage = 0; currentPage < questions.length; currentPage++)
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: LayoutBuilder(builder: (context, constraints) {
                  return Column(
                    children: [
                      SizedBox(
                        height: constraints.maxHeight / 4.5,
                        child: HeaderQuestion(
                          title: questions[currentPage].title,
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 4 / 6,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (var i = 0; i < 4; i++)
                              SizedBox(
                                height: (constraints.maxHeight * 4 / 6) / 4.6,
                                child: ResponseButton(
                                  isRight: questions[currentPage].correctIndex == i,
                                  selected: responses[currentPage] == i,
                                  isConfirmed: isConfirmed[currentPage],
                                  onChange: isConfirmed[currentPage] ? null : (_) => setResponse(i),
                                  titleResponse: questions[currentPage].listTitleResult[i],
                                ),
                              ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              child: CustomButtom(
                                text: isConfirmed[currentPage] ? "Proxima pergunta" : "Responder",
                                onPressed: responses[currentPage] == -1
                                    ? null
                                    : isConfirmed[currentPage]
                                        ? navigateToNextOrResultPage
                                        : confirmQuestion,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
        ],
      ),
    );
  }
}
