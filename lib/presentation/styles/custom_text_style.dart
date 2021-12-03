import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';

class CustomTextStyle {

  static ultraBoldTextStyle1({required Color color,required double letterSpacing}){
    return TextStyle( fontSize:26,fontWeight: FontWeight.w700,color: color==null?AppColors.textDarkColor:color,fontFamily: "PoppinsBold",letterSpacing: letterSpacing==null? null : letterSpacing  );
  }

  static ultraBoldTextStyle({required Color color,required double letterSpacing}){
    return TextStyle( fontSize:24,fontWeight: FontWeight.w700,color: color==null?AppColors.textDarkColor:color,fontFamily: "PoppinsBold",letterSpacing: letterSpacing==null? null : letterSpacing  );
  }

  static boldTextStyle({required Color color,fontFamily}){
    return TextStyle( fontSize:22,fontWeight: FontWeight.w700,color: color==null?AppColors.textDarkColor:color,fontFamily: fontFamily ?? "PoppinsRegular" );
  }

  static bigTextStyle({required Color color}){
    return TextStyle( fontSize:18,fontWeight: FontWeight.w600,color: color==null?AppColors.textDarkColor:color,fontFamily:"PoppinsRegular" );
  }

  static appBarTextStyle({required Color color,fontFamily}){
    return TextStyle( fontSize:20,fontWeight: FontWeight.w700,color: color==null?AppColors.textDarkColor:color,fontFamily:fontFamily==null?  "PoppinsRegular" : fontFamily );
  }

  static boldMediumTextStyle({required Color color,fontFamily}){
    return TextStyle( fontSize:16,fontWeight: FontWeight.w700,color: color==null?AppColors.textDarkColor:color,fontFamily: fontFamily==null ? "PoppinsRegular" : fontFamily );
  }

  static mediumTextStyle({required Color color}){
    return TextStyle( fontSize:16,fontWeight: FontWeight.w500,color: color==null?AppColors.textDarkColor:color,fontFamily: "PoppinsRegular" );
  }

  static smallTextStyle1({required Color color}){
    return TextStyle( fontSize:14,fontWeight: FontWeight.w500,color: color==null?AppColors.textDarkColor:color,fontFamily: "PoppinsRegular" );
  }

  static smallBoldTextStyle1({required Color color}){
    return TextStyle( fontSize:14,fontWeight: FontWeight.w700,color: color==null?AppColors.textDarkColor:color,fontFamily: "PoppinsBold" );
  }

  static ultraSmallBoldTextStyle({required Color color}){
    return TextStyle( fontSize:12,fontWeight: FontWeight.w700,color: color==null?AppColors.textDarkColor:color,fontFamily: "PoppinsBold" );
  }

  static ultraSmallTextStyle({required Color color}){
    return TextStyle( fontSize:12,fontWeight: FontWeight.w400,color: color==null?AppColors.textDarkColor:color,fontFamily: "PoppinsRegular" );
  }

// static itemDescription({Color color}){
//   return TextStyle( fontSize:14,fontWeight: FontWeight.w400,color: color==null?AppColors.textDarkColor:color,fontFamily: "MetroPolisRegular" );
// }


}