import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PickTheme extends StatefulWidget {
  Color color;
  IconData? icon;
  bool selected;
  PickTheme({
    super.key,
    required this.color,
    this.icon,
    this.selected = false,
  });

  @override
  State<PickTheme> createState() => _PickThemeState();
}

class _PickThemeState extends State<PickTheme> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          setState(() {});
        },
        child: SizedBox(
          height: 60,
          width: 60,
          child: CircleAvatar(
            backgroundColor: widget.color,
            child: Icon(
              widget.icon,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
