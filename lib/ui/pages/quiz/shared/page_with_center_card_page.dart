import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets/shared/appbar/custom_app_bar.dart';

class PageWithCenterCard extends StatelessWidget {
  const PageWithCenterCard({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: const Color(0xFFE5E9FF),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SizedBox(
            width: constraints.maxWidth,
            child: Center(
              child: Container(
                margin: EdgeInsets.only(bottom: constraints.maxHeight * 10 / 100),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(26),
                  border: Border.all(color: Colors.grey, width: 0.5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: children,
                  ),
                ),
                width: 85 / 100 * constraints.maxWidth,
                height: 4 / 10 * constraints.maxHeight,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
