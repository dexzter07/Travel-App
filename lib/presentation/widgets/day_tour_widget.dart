import 'package:cab_booking/data/models/day_tour_model.dart';
import 'package:cab_booking/presentation/pages/authentication/login.dart';
import 'package:cab_booking/presentation/pages/day_detail_page.dart';
import 'package:cab_booking/presentation/styles/custom_text_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'custom_text_widget.dart';
import 'package:get/get.dart';

class DayTourWidget extends StatelessWidget {

  final DayTourListModel? dayTourModel;
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
              Image(image: NetworkImage("http://cabbooking.rumtektechnologies.com/admin/${dayTourModel!.image}"),
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
                "₹ ${dayTourModel!.discountPrice}/- per person",
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
                onPressed: () async
                {
                  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                  sharedPreferences.setString("id", dayTourModel!.id);
                  if(FirebaseAuth.instance.currentUser == null){
                    Get.to(() => Login());
                  }
                  else{
                    Get.to(DayDetailPage(
                        id:dayTourModel!.id,
                        name:dayTourModel!.title,
                        image:dayTourModel!.image,
                        image2:dayTourModel!.image2,
                        image3:dayTourModel!.image3,
                        vehicleType:dayTourModel!.id,
                        discountPrice:dayTourModel!.discountPrice,
                        pointsCovered: dayTourModel!.pointCovered,
                    ));
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


