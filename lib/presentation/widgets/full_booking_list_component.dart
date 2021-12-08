import 'package:cab_booking/presentation/styles/app_colors.dart';
import 'package:cab_booking/presentation/styles/custom_text_style.dart';
import 'package:cab_booking/presentation/widgets/full_width_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_text_widget.dart';

class FullBookingListWidget extends StatelessWidget {
  const FullBookingListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 180,
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 10),
        decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: Offset(3,3)
              )
            ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.orange.shade100,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                blurRadius: 10,
                                spreadRadius: 2,
                                offset: Offset(3,3)
                            )
                          ]

                      ),

                      child: Image.asset(
                        "assets/images/car_category/wagonr.png",
                        fit: BoxFit.fitWidth,
                        height: 50,
                        width: 50,
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget("Car Category:",
                        style: CustomTextStyle.mediumTextStyle(
                            color: Colors.black),
                        alignText: false,
                        textOverflow: null),
                    CustomTextWidget("Capacity:",
                        style: CustomTextStyle.mediumTextStyle(
                            color: Colors.black),
                        alignText: false,
                        textOverflow: null),
                    CustomTextWidget("Air Conditioning:",
                        style: CustomTextStyle.mediumTextStyle(
                            color: Colors.black),
                        alignText: false,
                        textOverflow: null),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomTextWidget("Hatchback Non AC",
                        style: CustomTextStyle.mediumTextStyle(
                            color: Colors.black),
                        alignText: false,
                        textOverflow: null),
                    CustomTextWidget("4 Adults",
                        style: CustomTextStyle.mediumTextStyle(
                            color: Colors.black),
                        alignText: false,
                        textOverflow: null),
                    CustomTextWidget("Not Included",
                        style: CustomTextStyle.mediumTextStyle(
                            color: Colors.black),
                        alignText: false,
                        textOverflow: null),

                  ],
                ),

              ],
            ),
            SizedBox(height: 10,),
            CustomTextWidget("Maruti Wagon-R",
                style: CustomTextStyle.boldMediumTextStyle(
                    color: Colors.black),
                alignText: false,
                textOverflow: null),
            Row(
              children: [
                CustomTextWidget("Tap to see Terms and Conditions.",
                    style: CustomTextStyle.ultraSmallTextStyle(
                        color: Colors.deepOrangeAccent),
                    alignText: false,
                    textOverflow: null),
                Spacer(),
                MaterialButton(onPressed: (){},
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(22.0) ),
                child: Text("3000", style: TextStyle(color: Colors.white),),
                  color: AppColors.primaryButtonColor,
                )
              ],
            )
          ],
        ),


    );
  }
}
