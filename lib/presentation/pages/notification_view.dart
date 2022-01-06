import 'package:cab_booking/presentation/constants/app_constants.dart';
import 'package:cab_booking/presentation/styles/app_colors.dart';
import 'package:cab_booking/presentation/styles/custom_text_style.dart';
import 'package:cab_booking/presentation/widgets/custom_appbar.dart';
import 'package:cab_booking/presentation/widgets/custom_inkwell.dart';
import 'package:flutter/material.dart';

class NotificationView extends StatefulWidget {
  final String? payload;
  const NotificationView({required this.payload});
  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
            children: [
              SizedBox(height:20),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppConstants.screenHorizontalPadding,vertical: AppConstants.screenVerticalPadding),
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          Text("1 July 2020",style: CustomTextStyle.smallTextStyle1(color: Colors.grey),),
                          Text(widget.payload.toString(),style: TextStyle(fontSize: 30,color: Colors.red),),
                          CustomNotificationContainer(),
                          CustomNotificationContainer()
                        ],
                      ),
                      SizedBox(height: 10,),
                      Column(
                        children: [
                          Text("12 June 2020",style: CustomTextStyle.smallTextStyle1(color: Colors.grey),),
                          CustomNotificationContainer(),
                          CustomNotificationContainer(),
                          CustomNotificationContainer(),

                        ],
                      )
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


class CustomNotificationContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      margin: EdgeInsets.symmetric(vertical: 10),
      color: Colors.grey.withOpacity(0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('01:32 PM',style: CustomTextStyle.ultraSmallTextStyle(color: Colors.blue),),
              Spacer(),
              Container(decoration: BoxDecoration(color: Colors.green,shape: BoxShape.circle),height: 10,width: 10,)
            ],
          ),
          SizedBox(height: 5,),

          Text("Special Deals only for you...",style: CustomTextStyle.smallBoldTextStyle1(color: Colors.black),),
          SizedBox(height: 5,),

          Text("Grab now before it's gone",style: CustomTextStyle.ultraSmallTextStyle(color: Colors.black),),
          SizedBox(height: 5,),

          Row(
            children: [
              Spacer(),
              Text("View",style: CustomTextStyle.ultraSmallTextStyle(color: Colors.blue),)
            ],
          )
        ],
      ),
    );
  }
}
