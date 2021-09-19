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
      height: constraints.maxHeight * 27 / 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 18),
            child: Text(
              "Respostas",
              style: TextStyle(fontSize: 22, color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
