import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  final Color? backgroundColor, iconColor;
  final IconData? icon;
  final bool selected;
  final void Function(bool) onClick;

  const CustomCheckBox({
    Key? key,
    required this.backgroundColor,
    required this.icon,
    required this.iconColor,
    required this.selected,
    required this.onClick,
  }) : super(key: key);

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onClick(widget.selected);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: widget.selected ? Colors.blue : Colors.grey,
          ),
          color: widget.backgroundColor,
        ),
        height: 20,
        width: 20,
        child: Center(
          child: Icon(
            widget.icon,
            size: 20,
            color: widget.iconColor,
          ),
        ),
      ),
    );
  }
}
