import 'package:flutter/material.dart';

import 'custom_checkbox.dart';

class ResponseButton extends StatefulWidget {
  final BoxConstraints constraints;
  final bool selected;
  final void Function(bool?) onChange;
  final bool isRight;
  final bool isConfirmed;
  const ResponseButton({
    Key? key,
    required this.constraints,
    required this.onChange,
    required this.selected,
    required this.isRight,
    required this.isConfirmed,
  }) : super(key: key);

  @override
  State<ResponseButton> createState() => _ResponseButtonState();
}

class _ResponseButtonState extends State<ResponseButton> {
  @override
  Widget build(BuildContext context) {
    bool isSelectedAndConfirmedAndRight = widget.selected && widget.isConfirmed && widget.isRight;
    bool isSelectedAndConfirmedAndWrong = widget.selected && widget.isConfirmed && !widget.isRight;
    bool isNotSelectedAndConfirmedAndRight = !widget.selected && widget.isConfirmed && widget.isRight;
    bool isSelectedOnly = widget.selected;

    return Container(
      height: widget.constraints.maxHeight * 23 / 100,
      decoration: BoxDecoration(
        color: isSelectedAndConfirmedAndRight
            ? Colors.green[100]
            : isSelectedAndConfirmedAndWrong
                ? Colors.red[100]
                : isNotSelectedAndConfirmedAndRight
                    ? Colors.green[100]
                    : isSelectedOnly
                        ? Colors.blue[100]
                        : Colors.white,
        border: Border.all(
          color: isSelectedAndConfirmedAndRight
              ? Colors.green
              : isSelectedAndConfirmedAndWrong
                  ? Colors.red
                  : isNotSelectedAndConfirmedAndRight
                      ? Colors.green
                      : isSelectedOnly
                          ? Colors.blue
                          : Colors.grey,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(26),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: widget.constraints.maxHeight * 2 / 100,
              left: widget.constraints.maxHeight * 2 / 100,
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: CustomCheckBox(
                icon: isSelectedAndConfirmedAndRight || isNotSelectedAndConfirmedAndRight
                    ? Icons.check
                    : isSelectedAndConfirmedAndWrong
                        ? Icons.close
                        : null,
                iconColor: Colors.white,
                backgroundColor: isSelectedAndConfirmedAndRight
                    ? Colors.green
                    : isSelectedAndConfirmedAndWrong
                        ? Colors.red
                        : isNotSelectedAndConfirmedAndRight
                            ? Colors.green
                            : isSelectedOnly
                                ? Colors.blue
                                : Colors.white,
                selected: widget.selected,
                onClick: (val) {
                  widget.onChange(val);
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: widget.constraints.maxHeight * 2.8 / 100,
              left: widget.constraints.maxHeight * 2 / 100,
            ),
            child: Text(
              "Texto",
              style: TextStyle(
                fontSize: 24,
                color: isSelectedAndConfirmedAndRight
                    ? Colors.green
                    : isSelectedAndConfirmedAndWrong
                        ? Colors.red
                        : isNotSelectedAndConfirmedAndRight
                            ? Colors.green
                            : isSelectedOnly
                                ? Colors.blue
                                : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
