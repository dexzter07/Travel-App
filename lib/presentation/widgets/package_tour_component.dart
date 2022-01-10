import 'package:cab_booking/data/models/package_tour_model.dart';
import 'package:cab_booking/presentation/pages/authentication/login.dart';
import 'package:cab_booking/presentation/pages/package_detail_page.dart';
import 'package:cab_booking/presentation/styles/custom_text_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custom_text_widget.dart';

class PackageTourComponents extends StatelessWidget {
  final PackageTourListModel? packageTourModel;
  const PackageTourComponents({Key? key, this.packageTourModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.only(left: 8,right: 8),
        width: 280,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: NetworkImage("http://cabbooking.rumtektechnologies.com/admin/${packageTourModel!.image}"),
              fit: BoxFit.cover,
              width: double.infinity,
              height: 150,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextWidget(
              packageTourModel!.title,
              style: CustomTextStyle.smallBoldTextStyle1(
                color: Colors.grey.shade800,
              ),
              alignText: false,
              textOverflow: TextOverflow.ellipsis,
            ),
            Text(
              "Starting from",
              style: TextStyle(color: Colors.grey, fontSize: 11),
            ),
            Row(
              children: [
                Text(
                  "₹ ${packageTourModel!.discountPrice}/-",
                  style: CustomTextStyle.smallBoldTextStyle1(
                      color: Colors.green),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "₹ ${packageTourModel!.price}/-",
                  style: CustomTextStyle.smallTextStyle1(
                      color: Colors.grey),
                ),
              ],
            ),
            Text(
              "Per Person",
              style: TextStyle(color: Colors.grey, fontSize: 11),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.hotel,
                      color: packageTourModel!.upto3Start == '1' ? Colors.grey.shade700: Colors.grey.shade400

                    ),
                    Text(
                      "Upto 3 Stars",
                      style: TextStyle(
                        color: Colors.grey, fontSize: 11),

                        )
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.flight,
                        color: packageTourModel!.flight == '1' ? Colors.grey.shade700: Colors.grey.shade400
                    ),
                    Text(
                      "Flight",
                      style: TextStyle(
                          color: Colors.grey, fontSize: 11),
                    )
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.restaurant,
                        color: packageTourModel!.meal == '1' ? Colors.grey.shade700: Colors.grey.shade400
                    ),
                    Text(
                      "Meals",
                      style: TextStyle(
                          color: Colors.grey, fontSize: 11),
                    )
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.directions_car,
                        color: packageTourModel!.privateCab == '1' ? Colors.grey.shade700: Colors.grey.shade400
                    ),
                    Text(
                      "Private Cab",
                      style: TextStyle(
                          color: Colors.grey, fontSize: 11),
                    )
                  ],
                ),
              ],
            ),
            MaterialButton(
              height: 30.0,
              minWidth: double.infinity,
              color: Colors.deepOrangeAccent,
              textColor: Colors.white,
              child: new Text("View Details"),
              onPressed: () => {
                if(FirebaseAuth.instance.currentUser == null){
                  Get.to(() => Login())
                }
                else{
                  Get.to(PackageDetailPage(
                    id:packageTourModel!.id,
                    name:packageTourModel!.title,
                    image:packageTourModel!.image,
                    image2:packageTourModel!.image,
                    image3:packageTourModel!.image,
                    vehicleType:packageTourModel!.id,
                    discountPrice:packageTourModel!.discountPrice,
                  ))
                }
              },
              splashColor: Colors.redAccent,
            )
          ],
        ),
      ),
    );
  }
}
