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

    return Container(
      height: widget.constraints.maxHeight * 23 / 100,
      decoration: BoxDecoration(
        color: isSelectedAndConfirmedAndRight
            ? Color(0xffE5FFE6)
            : isSelectedAndConfirmedAndWrong
                ? Color(0xffFFD6D6)
                : isNotSelectedAndConfirmedAndRight
                    ? Color(0xffE5FFE6)
                    : isSelectedOnly
                        ? Color(0xffE5E9FF)
                        : Colors.white,
        border: Border.all(
          color: isSelectedAndConfirmedAndRight
              ? Color(0xff5CC772)
              : isSelectedAndConfirmedAndWrong
                  ? Color(0xffFF5C5C)
                  : isNotSelectedAndConfirmedAndRight
                      ? Color(0xff38C53D)
                      : isSelectedOnly
                          ? Color(0xff758CFF)
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
                active: !widget.isConfirmed,
                icon: isSelectedAndConfirmedAndRight || isNotSelectedAndConfirmedAndRight || isSelectedOnly
                    ? Icons.check
                    : isSelectedAndConfirmedAndWrong
                        ? Icons.close
                        : null,
                iconColor: Colors.white,
                backgroundColor: isSelectedAndConfirmedAndRight
                    ? Color(0xff38C53D)
                    : isSelectedAndConfirmedAndWrong
                        ? Color(0xffFF5A5A)
                        : isNotSelectedAndConfirmedAndRight
                            ? Color(0xff38C53D)
                            : isSelectedOnly
                                ? Color(0xff758CFF)
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
              widget.titleResponse,
              style: TextStyle(
                fontSize: 24,
                color: isSelectedAndConfirmedAndRight
                    ? Color(0xff38C53D)
                    : isSelectedAndConfirmedAndWrong
                        ? Color(0xffFF5B5B)
                        : isNotSelectedAndConfirmedAndRight
                            ? Color(0xff43C54F)
                            : isSelectedOnly
                                ? Color(0xff758CFF)
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
