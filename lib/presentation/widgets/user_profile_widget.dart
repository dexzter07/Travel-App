
import 'package:cab_booking/presentation/styles/custom_text_style.dart';
import 'package:flutter/material.dart';

import 'custom_text_widget.dart';

class UserProfileComponent extends StatelessWidget {

  String Title;
  Icon icon;
  UserProfileComponent({required this.Title,required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[100],
      ),
      child: Row(
        children: [
          icon,
          SizedBox(width: 10,),
          CustomTextWidget(Title,style: CustomTextStyle.mediumTextStyle(color: Colors.black), alignText: false, textOverflow: null,)
        ],
      ),
    );
  }
}