import 'package:cab_booking/presentation/styles/custom_text_style.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {

  final FormFieldValidator<String>? validator;
  final bool obSecureText;
  final BorderRadius borderRadius;
  final String? hintText;
  final int maxLines;
  final bool numberButton;
  final TextEditingController? controller;
  final EdgeInsets contentPadding;
  CustomTextField({required this.contentPadding,this.controller, this.validator,required this.obSecureText,required this.borderRadius,this.hintText,required this.maxLines,required this.numberButton});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: widget.controller,
      maxLines: widget.maxLines,
      obscureText: widget.obSecureText,
      validator: widget.validator,
      keyboardType: widget.numberButton==true ? TextInputType.number : null,
      style: CustomTextStyle.smallTextStyle1(color: Colors.black),
      decoration: InputDecoration(
          contentPadding: widget.contentPadding,
          hintText:  widget.hintText,
          hintStyle: CustomTextStyle.smallTextStyle1(color: Colors.grey),
          errorMaxLines: 1,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.4)),
              borderRadius: widget.borderRadius
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue.withOpacity(0.4)),
              borderRadius: widget.borderRadius
          ),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: widget.borderRadius
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: widget.borderRadius
          )
        // border: InputBorder.none
      ),
    );
  }
}


class CustomTextFieldWithIcon extends StatelessWidget {

  final Function validator;
  final bool obSecureText;
  final BorderRadius borderRadius;
  final String? hintText;
  final int maxLines;
  final bool numberButton;
  final TextEditingController? controller;
  final EdgeInsets contentPadding;
  final Icon icon;
  CustomTextFieldWithIcon({required this.icon,required this.contentPadding,this.controller,required this.validator,required this.obSecureText,required this.borderRadius,this.hintText,required this.maxLines,required this.numberButton});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: controller,
      maxLines: maxLines,
      obscureText: obSecureText,
      validator: validator(),
      keyboardType: numberButton==true ? TextInputType.number : null,
      style: CustomTextStyle.smallTextStyle1(color: Colors.white),
      decoration: InputDecoration(
          suffixIcon: icon,
          contentPadding: null,
          hintText: hintText,
          hintStyle: CustomTextStyle.smallTextStyle1(color: Colors.white),
          errorMaxLines: 1,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.9)),
              borderRadius: borderRadius
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.9)),
              borderRadius: borderRadius
          ),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: borderRadius
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: borderRadius
          )
        // border: InputBorder.none
      ),
    );
  }
}