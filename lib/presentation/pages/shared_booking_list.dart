import 'package:cab_booking/presentation/styles/app_colors.dart';
import 'package:cab_booking/presentation/widgets/car_widget.dart';
import 'package:cab_booking/presentation/widgets/shared_booking_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SharedBookingList extends StatefulWidget {
  final String? selectPerson;
  const SharedBookingList({this.selectPerson});

  @override
  _SharedBookingListState createState() => _SharedBookingListState();
}

class _SharedBookingListState extends State<SharedBookingList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vehicle List"),
        backgroundColor: AppColors.primaryColor,
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) { return InkWell(
            onTap: (){
             Get.to(() => CarWidget(selectPerson: widget.selectPerson));
            },
            child: SharedBookingComponent()); },

      ),
    );
  }
}
