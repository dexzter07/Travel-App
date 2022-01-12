import 'package:cab_booking/data/models/avail_day_tour_shared_cab_model.dart';
import 'package:cab_booking/presentation/styles/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SharedBookingComponent extends StatelessWidget {
  final AvailDayTourSharedCabModel? availDayTourSharedCabModel;
  SharedBookingComponent({this.availDayTourSharedCabModel});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8,vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(3,3)
            )
          ]

      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(availDayTourSharedCabModel!.title,style: TextStyle(fontSize: 14),textScaleFactor: 1,),
              SizedBox(height: 8,),
              Text(availDayTourSharedCabModel!.timing,style: TextStyle(fontSize: 20),textScaleFactor: 1,),


              SizedBox(height: 10,),
              Row(
                children: [
                  Text(availDayTourSharedCabModel!.vehicleModel,style: TextStyle(fontSize: 18),textScaleFactor: 1,),
                  SizedBox(width: 100,),
                  Text("${availDayTourSharedCabModel!.totalSeat} available",style: TextStyle(fontSize: 18),textScaleFactor: 1,),
                ],
              ),
              SizedBox(height: 10,),

              Row(
                children: [
                  Text("₹ ${availDayTourSharedCabModel!.price}",style: TextStyle(fontSize: 20),textScaleFactor: 1,),
                  SizedBox(width: Get.width * 0.6,),
                  Container(
                      decoration: BoxDecoration(
                          color: AppColors.primaryButtonColor,
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(Icons.arrow_forward, color: Colors.white,),
                      ))
                ],
              ),

            ],

          ),

        ],
      ),
    );
  }
}
