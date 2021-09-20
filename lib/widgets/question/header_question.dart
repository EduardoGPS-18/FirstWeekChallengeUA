import 'package:flutter/material.dart';

class HeaderQuestion extends StatelessWidget {
  final BoxConstraints constraints;
  final String title;

  const HeaderQuestion({
    Key? key,
    required this.constraints,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: constraints.maxWidth,
      height: constraints.maxHeight * 27 / 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            title,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
          const Expanded(child: Center()),
          const Padding(
            padding: EdgeInsets.only(bottom: 12, top: 12),
            child: Text(
              "Respostas",
              style: TextStyle(
                fontSize: 22,
                color: Color(0xff758CFF),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
