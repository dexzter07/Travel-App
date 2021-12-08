import 'package:cab_booking/presentation/pages/checkout_page.dart';
import 'package:cab_booking/presentation/styles/app_colors.dart';
import 'package:cab_booking/presentation/widgets/custom_silver_grid_delegate.dart';
import 'package:cab_booking/presentation/widgets/full_width_button.dart';
import 'package:cab_booking/presentation/widgets/permit_form_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PermitForm extends StatefulWidget {
  final String? selectPerson;
  const PermitForm({this.selectPerson});

  @override
  _PermitFormState createState() => _PermitFormState();
}

class _PermitFormState extends State<PermitForm> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Permit Form"),
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: ListView(
    children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "Let us make your permit done.",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
            ),
          ),
          Image.asset("assets/images/permit.jpg", width: 236, height: 236,),
          SizedBox(height: 10,),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8,),
        child: GridView.builder(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
              crossAxisCount: 1,
              height: 500
            ),
            itemCount: int.parse(widget.selectPerson.toString()),
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
    );
  }
}
