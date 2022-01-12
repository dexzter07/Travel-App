import 'package:cab_booking/logic/controllers/avail_day_tour_cab_shared_controller.dart';
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
  final AvailDayTourCabSharedController _availDayTourCabSharedController = Get.put(AvailDayTourCabSharedController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vehicle List"),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Obx(() => _availDayTourCabSharedController.isLoading.value == true?
      Center(
    child: CircularProgressIndicator(
    color: AppColors.primaryColor,
    ),
    )
    :ListView.builder(
        itemCount: _availDayTourCabSharedController.availSharedCab.length,
        itemBuilder: (context,index) { return InkWell(
            onTap: (){
             Get.to(() => CarWidget(selectPerson: widget.selectPerson));
            },
            child: SharedBookingComponent(
              availDayTourSharedCabModel: _availDayTourCabSharedController.availSharedCab[index],
            )); },

      ),
    ));
  }
}
