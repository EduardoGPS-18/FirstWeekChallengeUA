import 'package:flutter/material.dart';

import 'custom_checkbox.dart';

enum _ButtonState { unSelected, isSelected, isConfirmedRight, isConfirmedWrong }

class _ResponseButtonColorScheme {
  final Color? backgroundColor;
  final Color? checkboxColor;
  final Color borderColor;
  final Color textAndBorderColor;

  _ResponseButtonColorScheme({
    required this.backgroundColor,
    required this.borderColor,
    required this.checkboxColor,
    required this.textAndBorderColor,
  });
}

class ResponseButton extends StatefulWidget {
  final bool selected;
  final void Function(bool)? onChange;
  final bool isRight;
  final bool isConfirmed;
  final String titleResponse;

  const ResponseButton({
    Key? key,
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
  final Map<_ButtonState, _ResponseButtonColorScheme> _responseButtonColorScheme = {
    _ButtonState.unSelected: _ResponseButtonColorScheme(
      backgroundColor: const Color(0xFFFFFFFF),
      borderColor: const Color(0xFF9E9E9E),
      checkboxColor: const Color(0xFFFFFFFF),
      textAndBorderColor: const Color(0xFF000000),
    ),
    _ButtonState.isSelected: _ResponseButtonColorScheme(
      backgroundColor: const Color(0xffE5E9FF),
      borderColor: const Color(0xff758CFF),
      checkboxColor: const Color(0xff758CFF),
      textAndBorderColor: const Color(0xff758CFF),
    ),
    _ButtonState.isConfirmedRight: _ResponseButtonColorScheme(
      backgroundColor: const Color(0xffE5FFE6),
      borderColor: const Color(0xff5CC772),
      checkboxColor: const Color(0xff38C53D),
      textAndBorderColor: const Color(0xff43C54F),
    ),
    _ButtonState.isConfirmedWrong: _ResponseButtonColorScheme(
      backgroundColor: const Color(0xffFFD6D6),
      borderColor: const Color(0xffFF5C5C),
      checkboxColor: const Color(0xffFF5A5A),
      textAndBorderColor: const Color(0xffFF5B5B),
    ),
  };

  @override
  Widget build(BuildContext context) {
    bool isConfirmedAndRight = widget.selected && widget.isConfirmed && widget.isRight;
    bool isConfirmedAndWrong = widget.selected && widget.isConfirmed && !widget.isRight;
    bool isNotSelectedConfirmedAndRight = !widget.selected && widget.isConfirmed && widget.isRight;
    bool isSelectedOnly = widget.selected && !widget.isConfirmed;

    _ButtonState _buttonState = isConfirmedAndRight
        ? _ButtonState.isConfirmedRight
        : isConfirmedAndWrong
            ? _ButtonState.isConfirmedWrong
            : isSelectedOnly
                ? _ButtonState.isSelected
                : isNotSelectedConfirmedAndRight
                    ? _ButtonState.isConfirmedRight
                    : _ButtonState.unSelected;

    IconData? icon = isConfirmedAndWrong
        ? Icons.close
        : isConfirmedAndRight || isNotSelectedConfirmedAndRight || isSelectedOnly
            ? Icons.check
            : null;

    return Container(
      padding: const EdgeInsets.only(left: 8, top: 8),
      decoration: BoxDecoration(
        color: _responseButtonColorScheme[_buttonState]?.backgroundColor,
        border: Border.all(
          color: _responseButtonColorScheme[_buttonState]!.borderColor,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(26),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 4, right: 8),
            child: CustomCheckBox(
              borderColor: _responseButtonColorScheme[_buttonState]!.textAndBorderColor,
              active: !widget.isConfirmed,
              icon: icon,
              iconColor: Colors.white,
              backgroundColor: _responseButtonColorScheme[_buttonState]!.checkboxColor,
              selected: widget.selected,
              onClick: widget.onChange != null ? (value) => widget.onChange!(value) : null,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 7.8 / 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  widget.titleResponse,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 22,
                    color: _responseButtonColorScheme[_buttonState]!.textAndBorderColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
