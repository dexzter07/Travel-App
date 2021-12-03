import 'package:cab_booking/presentation/constants/app_constants.dart';
import 'package:cab_booking/presentation/styles/app_colors.dart';
import 'package:cab_booking/presentation/styles/custom_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTrip extends StatefulWidget {
  const MyTrip({Key? key}) : super(key: key);

  @override
  _MyTripState createState() => _MyTripState();
}

class _MyTripState extends State<MyTrip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.screenHorizontalPadding,
                    vertical: AppConstants.screenVerticalPadding),
                child: ListView(
                  children: [
                    Column(
                      children: [
                        CustomMyTrip(),
                        CustomMyTrip(),
                        CustomMyTrip(),
                        CustomMyTrip(),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomMyTrip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      margin: EdgeInsets.symmetric(vertical: 10),
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '30-10-2021',
                style: CustomTextStyle.ultraSmallTextStyle(color: AppColors.primaryColor),
              ),
              Spacer(),
              Container(
                decoration:
                    BoxDecoration(color: Colors.green, shape: BoxShape.circle),
                height: 10,
                width: 10,
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                "Lachung & Lachen 1 Night 2 Days",
                style: CustomTextStyle.smallBoldTextStyle1(color: Colors.black),
              ),
              Spacer(),
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/lachung.jpg"),
                radius: 30,
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          InkWell(
            onTap: (){},
            child: Text(
              "Leave a review",
              style: CustomTextStyle.ultraSmallTextStyle(color: Colors.green),
            ),
          )
        ],
      ),
    );
  }
}
