import 'package:cab_booking/presentation/pages/success.dart';
import 'package:cab_booking/presentation/styles/app_colors.dart';
import 'package:cab_booking/presentation/styles/custom_text_style.dart';
import 'package:cab_booking/presentation/widgets/custom_text_widget.dart';
import 'package:cab_booking/presentation/widgets/full_width_button.dart';
import 'package:cab_booking/presentation/widgets/shared_booking_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout Details"),
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
      ),
      body: ListView(
        children: [
          SharedBookingComponent(),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: Offset(3, 3))
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget("Fare Details",
                    style: CustomTextStyle.bigTextStyle(color: Colors.black),
                    alignText: false,
                    textOverflow: null),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      CustomTextWidget("Ride Fare (in Rs.)",
                          style: CustomTextStyle.boldMediumTextStyle(
                              color: Colors.black),
                          alignText: false,
                          textOverflow: null),
                      Spacer(),
                      CustomTextWidget("₹ 1200",
                          style: CustomTextStyle.boldMediumTextStyle(
                              color: Colors.black),
                          alignText: false,
                          textOverflow: null),
                    ],
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      CustomTextWidget("Goods & Services Tax (in Rs.)",
                          style: CustomTextStyle.boldMediumTextStyle(
                              color: Colors.black),
                          alignText: false,
                          textOverflow: null),
                      Spacer(),
                      CustomTextWidget("₹ 60",
                          style: CustomTextStyle.boldMediumTextStyle(
                              color: Colors.black),
                          alignText: false,
                          textOverflow: null),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        CustomTextWidget("Total Fare (in Rs.)",
                            style: CustomTextStyle.boldMediumTextStyle(
                                color: Colors.white),
                            alignText: false,
                            textOverflow: null),
                        Spacer(),
                        CustomTextWidget("₹ 1260",
                            style: CustomTextStyle.boldMediumTextStyle(
                                color: Colors.white),
                            alignText: false,
                            textOverflow: null),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: Offset(3, 3))
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                    "By clicking on the Proceed To Payment button, you agree to our Terms & Condition of Our App and that you have read our Privacy Policy and User Agreement.",
                    style: CustomTextStyle.smallTextStyle1(color: Colors.black),
                    alignText: false,
                    textOverflow: null),
                SizedBox(
                  height: 8,
                ),
                CustomTextWidget(
                    "Also please make sure to check our Cancellation Policy.",
                    style: CustomTextStyle.smallTextStyle1(color: Colors.black),
                    alignText: false,
                    textOverflow: null),
                SizedBox(
                  height: 30,
                ),
                FullWidthButton(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    border: Border.all(
                      color: Colors.red,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    title: "Proceed To Payment",
                    color: AppColors.primaryButtonColor,
                    onTap: () {
                      Get.to(() => SuccessPage());
                    }),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
