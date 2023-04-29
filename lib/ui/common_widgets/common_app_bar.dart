import 'package:flutter/material.dart';
import 'package:ui_scapia/ui/theme_constants.dart';

class CommonAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final Widget? flexibleSpace;
  final double? elevation;
  final bool centerTitle;
  const CommonAppBar(
      {super.key,
      required this.title,
      this.flexibleSpace,
      this.elevation = 1,
      this.centerTitle = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      iconTheme: const IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      centerTitle: centerTitle,
      elevation: elevation,
      flexibleSpace: flexibleSpace,
      title: Text(
        title,
        style: ktextStyle16Bold.copyWith(color: Colors.black),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
