import 'package:cab_booking/presentation/styles/app_colors.dart';
import 'package:cab_booking/presentation/styles/custom_text_style.dart';
import 'package:cab_booking/presentation/widgets/custom_text_widget.dart';
import 'package:cab_booking/presentation/widgets/full_booking_list_component.dart';
import 'package:cab_booking/presentation/widgets/full_width_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'full_booking_permit_form.dart';

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
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
                onTap: () {
                  Get.defaultDialog(
                    title: "Inclusions & Exclusions",
                    titleStyle: CustomTextStyle.boldMediumTextStyle(color: AppColors.primaryButtonColor),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    content: Column(
                      children: [
                        Divider(),
                        Row(
                          children: [
                            Icon(
                              Icons.check,
                              color: AppColors.primaryColor,
                              size: 20,
                            ),
                            Text(
                              "Door Pickup and Drop within City.",
                              style: CustomTextStyle.ultraSmallTextStyle(
                                  color: Colors.grey),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.check,
                              color: AppColors.primaryColor,
                              size: 20,
                            ),
                            Text(
                              "1 Pickup & 1 Drop point.",
                              style: CustomTextStyle.ultraSmallTextStyle(
                                  color: Colors.grey),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.check,
                              color: AppColors.primaryColor,
                              size: 20,
                            ),
                            Flexible(
                                child: CustomTextWidget(
                              "Waiting time & extra service will be extra charged.",
                              style: CustomTextStyle.ultraSmallTextStyle(
                                  color: Colors.grey),
                              textOverflow: TextOverflow.ellipsis,
                              alignText: false,
                            ))
                          ],
                        ),
                        Divider(),
                        Row(
                          children: [
                            Icon(
                              Icons.warning,
                              color: Colors.red,
                              size: 20,
                            ),
                            Text(
                              "Cancellation Charges",
                              style: CustomTextStyle.ultraSmallBoldTextStyle(
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.close,
                              color: AppColors.primaryColor,
                              size: 20,
                            ),
                            Flexible(
                                child: Text(
                              "5% Cancellation Charges, if cancelled online before 12 hours of Travel Time.",
                              style: CustomTextStyle.ultraSmallTextStyle(
                                  color: Colors.grey),
                            ))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.close,
                              color: AppColors.primaryColor,
                              size: 20,
                            ),
                            CustomTextWidget(
                              "No Refund within 12 hours of Travel Time.",
                              style: CustomTextStyle.ultraSmallTextStyle(
                                  color: Colors.grey),
                              textOverflow: TextOverflow.ellipsis,
                              alignText: false,
                            )
                          ],
                        ),
                      ],
                    ),
                    textConfirm: "PROCEED",
                    buttonColor: AppColors.primaryButtonColor,
                    confirmTextColor: Colors.white,
                    confirm: FullWidthButton(
                      margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                        padding: EdgeInsets.symmetric(vertical: 8),
                        borderRadius: BorderRadius.circular(5),
                        title: "PROCEED",
                        color: AppColors.primaryButtonColor,
                        onTap: () {
                        Get.to(FullBookingPermitForm());
                        }),
                  );
                },
                child: FullBookingListWidget());
          },
        ),
      ),
    );
  }
}
