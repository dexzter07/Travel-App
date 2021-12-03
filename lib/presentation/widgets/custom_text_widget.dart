import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {

  final String text;
  final TextStyle ? style;
  final bool alignText;
  final TextOverflow ? textOverflow;
  CustomTextWidget(this.text,{required this.style,required this.alignText,required this.textOverflow});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: style ?? TextStyle(fontFamily: "PoppinsRegular"),textScaleFactor: 0.87,textAlign: alignText==true? TextAlign.center : null,overflow: textOverflow == null ? null : TextOverflow.ellipsis,);
  }
}
