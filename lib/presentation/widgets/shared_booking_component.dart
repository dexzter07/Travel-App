import 'package:cab_booking/presentation/styles/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SharedBookingComponent extends StatelessWidget {


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
              Text("Gangtok -> Tsango -> Baba Mandir -> Gangtok",style: TextStyle(fontSize: 14),textScaleFactor: 1,),
              SizedBox(height: 8,),
              Row(
                children: [
                  Text("6:30 am",style: TextStyle(fontSize: 20),textScaleFactor: 1,),
                  SizedBox(width: 10,),
                  Text(" - ",style: TextStyle(fontSize: 20),textScaleFactor: 1,),
                  SizedBox(width: 10,),
                  Text("4:30 pm ",style: TextStyle(fontSize: 20),textScaleFactor: 1,),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text("Maruti Wagon-R",style: TextStyle(fontSize: 18),textScaleFactor: 1,),
                  SizedBox(width: 100,),
                  Text("4 seats",style: TextStyle(fontSize: 18),textScaleFactor: 1,),
                ],
              ),
              SizedBox(height: 10,),

              Row(
                children: [
                  Text("₹ 1200",style: TextStyle(fontSize: 20),textScaleFactor: 1,),
                  SizedBox(width: 240,),
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