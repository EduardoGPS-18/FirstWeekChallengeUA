import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;

  const CustomAppBar({Key? key, this.leading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      backgroundColor: const Color(0xff758CFF),
      elevation: 0,
      title: const Text("Perguntas e respostar"),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
