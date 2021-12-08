import 'package:cab_booking/presentation/styles/app_colors.dart';
import 'package:cab_booking/presentation/widgets/full_booking_list_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FullBookingList extends StatefulWidget {
  const FullBookingList({Key? key}) : super(key: key);

  @override
  _FullBookingListState createState() => _FullBookingListState();
}

class _FullBookingListState extends State<FullBookingList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Vehicle List"),
          backgroundColor: AppColors.primaryColor,
          elevation: 0,

        ),
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) { return FullBookingListWidget(); },

        ),
      ),
    );
  }
}
