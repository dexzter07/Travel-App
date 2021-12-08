import 'package:cab_booking/data/models/car_category_model.dart';
import 'package:cab_booking/data/models/day_tour_model.dart';
import 'package:cab_booking/presentation/pages/authentication/login.dart';
import 'package:cab_booking/presentation/pages/day_detail_page.dart';
import 'package:cab_booking/presentation/styles/custom_text_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'custom_text_widget.dart';
import 'package:get/get.dart';

class DayTourWidget extends StatelessWidget {

  final DayTourModel? dayTourModel;
  DayTourWidget({this.dayTourModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2,vertical: 2),

      child: Card(
        child: Container(
          padding: EdgeInsets.all(2),
          color: Colors.white,
          width: 160,
          child: Column(
            children: [
              Image.asset(
                dayTourModel!.imageUrl.toString(),
                fit: BoxFit.cover,

                height: 120,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextWidget(
                dayTourModel!.title.toString(),
                style: CustomTextStyle.mediumTextStyle(
                  color: Colors.black,
                ),
                alignText: false,
                textOverflow: TextOverflow.visible,
              ),
              CustomTextWidget(
                dayTourModel!.price.toString(),
                style: CustomTextStyle.smallBoldTextStyle1(
                  color: Colors.green,
                ),
                alignText: false,
                textOverflow: TextOverflow.visible,
              ),
              MaterialButton(
                height: 30.0,
                minWidth: 150.0,
                color: Colors.deepOrangeAccent,
                textColor: Colors.white,
                child: new Text("Book Now"),
                onPressed: () =>
                {
                  if(FirebaseAuth.instance.currentUser == null){
                    Get.to(() => Login())
                  }
                  else{
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => DayDetailPage()))
                  }
                },
                splashColor: Colors.redAccent,
              )
            ],
          ),
        ),
      ),
    );
  }
}


