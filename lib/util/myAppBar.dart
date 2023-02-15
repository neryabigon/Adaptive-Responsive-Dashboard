import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget{
  const MyAppBar({super.key, required this.useLightMode, required this.handleBrightnessChange});

  final bool useLightMode;
  final Function(bool useLightMode) handleBrightnessChange;

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MyAppBarState extends State<MyAppBar> {


  @override
  Widget build(BuildContext context) {
    return AppBar(
        // backgroundColor: appBarColor,
        title: const Text(' '),
        centerTitle: false,
        actions: [
          IconButton(
            icon: widget.useLightMode
                ? const Icon(Icons.wb_sunny_outlined)
                : const Icon(Icons.wb_sunny),
            onPressed: () {
              widget.handleBrightnessChange(!widget.useLightMode);
            },
            tooltip: "Toggle brightness",
          ),
        ]
    );
  }
}
