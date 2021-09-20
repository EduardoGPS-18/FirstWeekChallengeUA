import 'package:flutter/material.dart';

import 'custom_checkbox.dart';

class ResponseButton extends StatefulWidget {
  final BoxConstraints constraints;
  final bool selected;
  final void Function(bool?) onChange;
  final bool isRight;
  final bool isConfirmed;
  final String titleResponse;

  const ResponseButton({
    Key? key,
    required this.constraints,
    required this.onChange,
    required this.selected,
    required this.isRight,
    required this.isConfirmed,
    required this.titleResponse,
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
    bool isSelectedOnly = widget.selected && !widget.isConfirmed;

    final Color backgroundColor = isSelectedAndConfirmedAndRight
        ? const Color(0xffE5FFE6)
        : isSelectedAndConfirmedAndWrong
            ? const Color(0xffFFD6D6)
            : isNotSelectedAndConfirmedAndRight
                ? const Color(0xffE5FFE6)
                : isSelectedOnly
                    ? const Color(0xffE5E9FF)
                    : Colors.white;
    final Color borderColor = isSelectedAndConfirmedAndRight
        ? const Color(0xff5CC772)
        : isSelectedAndConfirmedAndWrong
            ? const Color(0xffFF5C5C)
            : isNotSelectedAndConfirmedAndRight
                ? const Color(0xff38C53D)
                : isSelectedOnly
                    ? const Color(0xff758CFF)
                    : Colors.grey;

    final Color checkBoxColor = isSelectedAndConfirmedAndRight
        ? const Color(0xff38C53D)
        : isSelectedAndConfirmedAndWrong
            ? const Color(0xffFF5A5A)
            : isNotSelectedAndConfirmedAndRight
                ? const Color(0xff38C53D)
                : isSelectedOnly
                    ? const Color(0xff758CFF)
                    : Colors.white;

    final Color textColor = isSelectedAndConfirmedAndRight
        ? const Color(0xff38C53D)
        : isSelectedAndConfirmedAndWrong
            ? const Color(0xffFF5B5B)
            : isNotSelectedAndConfirmedAndRight
                ? const Color(0xff43C54F)
                : isSelectedOnly
                    ? const Color(0xff758CFF)
                    : Colors.black;
    return Container(
      height: widget.constraints.maxHeight * 23 / 100,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          color: borderColor,
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
                active: !widget.isConfirmed,
                icon: isSelectedAndConfirmedAndRight || isNotSelectedAndConfirmedAndRight || isSelectedOnly
                    ? Icons.check
                    : isSelectedAndConfirmedAndWrong
                        ? Icons.close
                        : null,
                iconColor: Colors.white,
                backgroundColor: checkBoxColor,
                selected: widget.selected,
                onClick: (val) {
                  widget.onChange(val);
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: widget.constraints.maxHeight * 2.8 / 100,
              left: widget.constraints.maxHeight * 2 / 100,
            ),
            child: RichText(
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                text: widget.titleResponse,
                style: TextStyle(
                  fontSize: 22,
                  color: textColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
