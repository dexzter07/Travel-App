import 'package:cab_booking/presentation/styles/app_colors.dart';
import 'package:cab_booking/presentation/styles/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'custom_inkwell.dart';

class FullWidthButton extends StatelessWidget {

  final String title;
  final Color ? color;
  final VoidCallback onTap;
  final BorderRadius? borderRadius;
  final Border ? border;
  final EdgeInsets ? padding;
  final EdgeInsets ? margin;

  FullWidthButton({required this.title,required this.color,required this.onTap, this.borderRadius, this.border, this.padding, this.margin});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: borderRadius,
            border:  border == null ? null : border ,
            color: color?? AppColors.primaryColor
        ),
        padding: padding ?? EdgeInsets.symmetric(vertical: 10),
        margin: margin ?? EdgeInsets.symmetric(horizontal: 0,vertical: 10),
        child: Center(child: Text(title,style: CustomTextStyle.appBarTextStyle(color:Colors.white,fontFamily: "PoppinsRegular"),),),
      ),
    );
  }
}



class FullWidthButtonWithIcon extends StatelessWidget {

  final String title;
  final Icon icon;
  final Color color;
  final Function onTap;
  final BorderRadius borderRadius;
  final Border ? border;
  final EdgeInsets ? padding;
  final EdgeInsets ? margin;

  FullWidthButtonWithIcon({required this.title,required this.color,required this.onTap,required this.borderRadius,required this.border,required this.padding,required this.margin,required this.icon});

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: borderRadius,
            border:  border == null ? null : border ,
            color: color
        ),
        padding: padding ?? EdgeInsets.symmetric(vertical: 22),
        margin: margin ?? EdgeInsets.symmetric(horizontal: 0,vertical: 10),
        child:Row(
          children: [
            Expanded(child: Text(title,style: CustomTextStyle.boldMediumTextStyle(color:border == null ? Colors.white : Colors.grey),)),
            icon
          ],
        ),
      ),
    );
  }
}