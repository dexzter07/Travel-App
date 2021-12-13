import 'package:cab_booking/presentation/constants/app_constants.dart';
import 'package:cab_booking/presentation/styles/app_colors.dart';
import 'package:cab_booking/presentation/styles/custom_text_style.dart';
import 'package:cab_booking/presentation/widgets/custom_silver_grid_delegate.dart';
import 'package:cab_booking/presentation/widgets/custom_text_field.dart';
import 'package:cab_booking/presentation/widgets/custom_text_widget.dart';
import 'package:cab_booking/presentation/widgets/full_width_button.dart';
import 'package:cab_booking/presentation/widgets/permit_form_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'checkout_page.dart';


class FullBookingPermitForm extends StatefulWidget {
  const FullBookingPermitForm({Key? key}) : super(key: key);

  @override
  _FullBookingPermitFormState createState() => _FullBookingPermitFormState();
}

class _FullBookingPermitFormState extends State<FullBookingPermitForm> {
  String? _selectPerson = "1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Permit Form"),
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.screenHorizontalPadding,vertical: AppConstants.screenVerticalPadding),
        child: ListView(
          children: [
            Text(
              "Let us make your permit done.",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600,color: AppColors.primaryColor),
            ),
          SizedBox(height: 10,),
          Row(
            children: [
              CustomTextWidget("Total No. of Person",
                  style: CustomTextStyle.boldMediumTextStyle(
                      color: Colors.black),
                  alignText: false,
                  textOverflow: null),
              Spacer(),
              Container(
                height: 30,
                padding: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey.shade300)),
                child: DropdownButton<String>(
                  isExpanded: false,
                  underline: SizedBox(),
                  menuMaxHeight: 400,
                  hint: Text("1",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      )),
                  items: <String>[
                    "1",
                    "2",
                    "3",
                    "4",
                    "5",
                    "6",
                    "7",
                    "8",
                    "9",
                    "10",
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectPerson = newValue;
                    });
                  },
                  value: _selectPerson,
                ),
              ),
            ],
          ),
            SizedBox(height: 10,),
            CustomTextWidget(
              "Temporary Address / Hotel Address",
              style: CustomTextStyle.boldMediumTextStyle(color: Colors.black),
              alignText: false,
              textOverflow: null,
            ),
            CustomTextField(
                contentPadding: EdgeInsets.all(10),
                validator: () {},
                obSecureText: false,
                borderRadius: BorderRadius.circular(10),
                maxLines: 2,
                numberButton: false),
            SizedBox(
              height: 10,
            ),
            CustomTextWidget(
              "Permanent Address",
              style: CustomTextStyle.boldMediumTextStyle(color: Colors.black),
              alignText: false,
              textOverflow: null,
            ),
            CustomTextField(
                contentPadding: EdgeInsets.all(10),
                validator: () {},
                obSecureText: false,
                borderRadius: BorderRadius.circular(10),
                maxLines: 2,
                numberButton: false),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8,),
              child: GridView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                      crossAxisCount: 1,
                      height: 280
                  ),
                  itemCount: int.parse(_selectPerson!),
                  itemBuilder: (context,index){
                    return PermitFormWidget();
                  }
              ),
            ),
            FullWidthButton(
                margin: EdgeInsets.symmetric(horizontal: 20,vertical:8),
                borderRadius: BorderRadius.circular(10),
                title: "Checkout",
                color: AppColors.primaryButtonColor,
                onTap: () {
                  Get.to(CheckoutPage());
                })
          ],
        ),
      ),
    );
  }
}
