import 'package:flutter/material.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  TopBar({super.key, required this.index});
  List titles = ["COUNTRIES & LATEST NEWS", "Latest News","LEAGUES"];
  final int index;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: const Color(0xFF38003C),
        leading: const BackButton(
          color: Colors.white,
        ),
        title: Text(
          titles[index],
          style: const TextStyle(
              fontFamily: "SofiaProBold",
              color: Colors.white,
              fontWeight: FontWeight.w600),
        ));
  }
}
