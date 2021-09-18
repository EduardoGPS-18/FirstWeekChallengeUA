import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      elevation: 0,
      title: const Text("Perguntas e respostar"),
      centerTitle: true,
      automaticallyImplyLeading: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
