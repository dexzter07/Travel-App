import 'package:cab_booking/presentation/styles/app_colors.dart';
import 'package:cab_booking/presentation/styles/custom_text_style.dart';
import 'package:cab_booking/presentation/widgets/custom_inkwell.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool hideBackIcon;

  CustomAppBar({required this.title,required this.hideBackIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: Row(
        children: [
          hideBackIcon == true? Container():InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios, color: Colors.white, size: 20,),
          ),
          Text(title, style: CustomTextStyle.appBarTextStyle(color: Colors.white, fontFamily: "PoppinsRegular"),)
        ],
      ),
    );
  }
}

