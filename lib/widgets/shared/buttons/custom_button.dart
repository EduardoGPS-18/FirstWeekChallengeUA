import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const CustomButtom({
    Key? key,
    this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: const Color(0xff758CFF),
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
