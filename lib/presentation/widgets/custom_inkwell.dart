import 'package:flutter/material.dart';

class CustomInkWell extends StatelessWidget {

  final Function onTap;
  final Widget child;
  CustomInkWell({required this.onTap,required this.child});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => onTap,
      child: child,
    );
  }
}