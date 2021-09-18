import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets/shared/appbar/custom_app_bar.dart';
import '../../../widgets/shared/buttons/custom_button.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  bool val = false;

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
                Container(
                  color: Colors.amber,
                  height: constraints.maxHeight * 27 / 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum ",
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 18),
                        child: Text(
                          "Respostas",
                          style: TextStyle(fontSize: 22, color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.black12,
                  height: constraints.maxHeight * 58 / 100,
                  child: LayoutBuilder(
                    builder: (context, constraints) => ListView.separated(
                      separatorBuilder: (ctx, i) => SizedBox(
                        height: constraints.maxHeight * 2 / 100,
                      ),
                      itemCount: 4,
                      itemBuilder: (ctx, i) => Container(
                        height: constraints.maxHeight * 23 / 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 0.5),
                          borderRadius: BorderRadius.circular(26),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: constraints.maxHeight * 2 / 100),
                              child: Checkbox(
                                value: val,
                                onChanged: (v) {},
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: constraints.maxHeight * 2.8 / 100),
                              child: const Text(
                                "Texto",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
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
                    text: "Responder",
                    onPressed: () {},
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
