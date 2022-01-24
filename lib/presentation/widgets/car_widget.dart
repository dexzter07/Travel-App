import 'package:cab_booking/data/models/seat_avail_model.dart';
import 'package:cab_booking/logic/controllers/seat_avail_controller.dart';
import 'package:cab_booking/presentation/pages/permit_form.dart';
import 'package:cab_booking/presentation/styles/app_colors.dart';
import 'package:cab_booking/presentation/widgets/full_width_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LuxuryCarWidget extends StatefulWidget {
  final String? selectPerson;
  final SeatAvailModel? seatAvailData;
  const LuxuryCarWidget({this.selectPerson, this.seatAvailData});

  @override
  _LuxuryCarWidgetState createState() => _LuxuryCarWidgetState();
}

class _LuxuryCarWidgetState extends State<LuxuryCarWidget> {
  SeatAvailController _seatAvailController = Get.put(SeatAvailController());
  final list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.seatAvailData!.seatBooked.toString()),
          backgroundColor: AppColors.primaryColor,
        ),
        body: Obx(() => _seatAvailController.isLoading.value == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(children: [
                SizedBox(
                  height: 20,
                ),
                Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/images/car_top_view.png",
                        fit: BoxFit.fill,
                        height: 470,
                        width: 300,
                      ),
                    ),
                    Positioned(
                      top: 180,
                      left: 95,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              _seatAvailController.booked.value == true
                                  ? IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.event_seat_sharp,
                                        color: Colors.red,
                                        size: 55,
                                      ))
                                  : IconButton(
                                      icon: (_seatAvailController
                                                  .onPressed.value ==
                                              true
                                          ? Icon(
                                              Icons.event_seat_sharp,
                                              color: Colors.green,
                                              size: 55,
                                            )
                                          : Icon(
                                              Icons.event_seat_sharp,
                                              color: Colors.grey,
                                              size: 55,
                                            )),
                                      onPressed: () {
                                        if (_seatAvailController
                                                .onPressed.value ==
                                            true) {
                                          list.remove(
                                              _seatAvailController.seats.value);
                                          _seatAvailController.onPressed.value =
                                              false;
                                        } else {
                                          _seatAvailController.seats.value =
                                              "1";
                                          list.add(
                                              _seatAvailController.seats.value);
                                          _seatAvailController.onPressed.value =
                                              true;
                                        }
                                      }),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  margin: EdgeInsets.fromLTRB(30, 20, 0, 0),
                                  child: Image.asset(
                                    "assets/images/steering.png",
                                    width: 50,
                                    fit: BoxFit.cover,
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              _seatAvailController.booked1.value == true
                                  ? IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.event_seat_sharp,
                                        color: Colors.red,
                                        size: 55,
                                      ))
                                  : IconButton(
                                      icon: (_seatAvailController
                                                  .onPressed1.value ==
                                              true
                                          ? Icon(
                                              Icons.event_seat_sharp,
                                              color: Colors.green,
                                              size: 55,
                                            )
                                          : Icon(
                                              Icons.event_seat_sharp,
                                              color: Colors.grey,
                                              size: 55,
                                            )),
                                      onPressed: () {
                                        if (_seatAvailController
                                                .onPressed1.value ==
                                            true) {
                                          list.remove(_seatAvailController
                                              .seats1.value);
                                          _seatAvailController
                                              .onPressed1.value = false;
                                        } else {
                                          _seatAvailController.seats1.value =
                                              "2";
                                          list.add(_seatAvailController
                                              .seats1.value);
                                          _seatAvailController
                                              .onPressed1.value = true;
                                        }
                                      }),
                              SizedBox(
                                width: 5,
                              ),
                              _seatAvailController.booked2.value == true
                                  ? IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.event_seat_sharp,
                                        color: Colors.red,
                                        size: 55,
                                      ))
                                  : IconButton(
                                      icon: (_seatAvailController
                                                  .onPressed2.value ==
                                              true
                                          ? Icon(
                                              Icons.event_seat_sharp,
                                              color: Colors.green,
                                              size: 55,
                                            )
                                          : Icon(
                                              Icons.event_seat_sharp,
                                              color: Colors.grey,
                                              size: 55,
                                            )),
                                      onPressed: () {
                                        if (_seatAvailController
                                                .onPressed2.value ==
                                            true) {
                                          list.remove(_seatAvailController
                                              .seats2.value);
                                          _seatAvailController
                                              .onPressed2.value = false;
                                        } else {
                                          _seatAvailController.seats2.value =
                                              "3";
                                          list.add(_seatAvailController
                                              .seats2.value);
                                          _seatAvailController
                                              .onPressed2.value = true;
                                        }
                                      }),
                              SizedBox(
                                width: 5,
                              ),
                              _seatAvailController.booked3.value == true
                                  ? IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.event_seat_sharp,
                                        color: Colors.red,
                                        size: 55,
                                      ))
                                  : IconButton(
                                      icon: (_seatAvailController
                                                  .onPressed3.value ==
                                              true
                                          ? Icon(
                                              Icons.event_seat_sharp,
                                              color: Colors.green,
                                              size: 55,
                                            )
                                          : Icon(
                                              Icons.event_seat_sharp,
                                              color: Colors.grey,
                                              size: 55,
                                            )),
                                      onPressed: () {
                                        if (_seatAvailController
                                                .onPressed3.value ==
                                            true) {
                                          list.remove(_seatAvailController
                                              .seats3.value);
                                          _seatAvailController
                                              .onPressed3.value = false;
                                        } else {
                                          _seatAvailController.seats3.value =
                                              "4";
                                          list.add(_seatAvailController
                                              .seats3.value);
                                          _seatAvailController
                                              .onPressed3.value = true;
                                        }
                                      }),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              _seatAvailController.booked4.value == true
                                  ? IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.event_seat_sharp,
                                        color: Colors.red,
                                        size: 55,
                                      ))
                                  : IconButton(
                                      icon: (_seatAvailController
                                                  .onPressed4.value ==
                                              true
                                          ? Icon(
                                              Icons.event_seat_sharp,
                                              color: Colors.green,
                                              size: 55,
                                            )
                                          : Icon(
                                              Icons.event_seat_sharp,
                                              color: Colors.grey,
                                              size: 55,
                                            )),
                                      onPressed: () {
                                        if (_seatAvailController
                                                .onPressed4.value ==
                                            true) {
                                          list.remove(_seatAvailController
                                              .seats4.value);
                                          _seatAvailController
                                              .onPressed4.value = false;
                                        } else {
                                          _seatAvailController.seats4.value =
                                              "5";
                                          list.add(_seatAvailController
                                              .seats4.value);
                                          _seatAvailController
                                              .onPressed4.value = true;
                                        }
                                      }),
                              SizedBox(
                                width: 5,
                              ),
                              _seatAvailController.booked5.value == true
                                  ? IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.event_seat_sharp,
                                        color: Colors.red,
                                        size: 55,
                                      ))
                                  : IconButton(
                                      icon: (_seatAvailController
                                                  .onPressed5.value ==
                                              true
                                          ? Icon(
                                              Icons.event_seat_sharp,
                                              color: Colors.green,
                                              size: 55,
                                            )
                                          : Icon(
                                              Icons.event_seat_sharp,
                                              color: Colors.grey,
                                              size: 55,
                                            )),
                                      onPressed: () {
                                        if (_seatAvailController
                                                .onPressed5.value ==
                                            true) {
                                          list.remove(_seatAvailController
                                              .seats5.value);
                                          _seatAvailController
                                              .onPressed5.value = false;
                                        } else {
                                          _seatAvailController.seats5.value =
                                              "6";
                                          list.add(_seatAvailController
                                              .seats5.value);
                                          _seatAvailController
                                              .onPressed5.value = true;
                                        }
                                      }),
                              SizedBox(
                                width: 5,
                              ),
                              _seatAvailController.booked6.value == true
                                  ? IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.event_seat_sharp,
                                        color: Colors.red,
                                        size: 55,
                                      ))
                                  : IconButton(
                                      icon: (_seatAvailController
                                                  .onPressed6.value ==
                                              true
                                          ? Icon(
                                              Icons.event_seat_sharp,
                                              color: Colors.green,
                                              size: 55,
                                            )
                                          : Icon(
                                              Icons.event_seat_sharp,
                                              color: Colors.grey,
                                              size: 55,
                                            )),
                                      onPressed: () {
                                        if (_seatAvailController
                                                .onPressed6.value ==
                                            true) {
                                          list.remove(_seatAvailController
                                              .seats6.value);
                                          _seatAvailController
                                              .onPressed6.value = false;
                                        } else {
                                          _seatAvailController.seats6.value =
                                              "7";
                                          list.add(_seatAvailController
                                              .seats6.value);
                                          _seatAvailController
                                              .onPressed6.value = true;
                                        }
                                      }),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.event_seat_sharp,
                            color: Colors.green,
                            size: 30,
                          ),
                          Text(" Seat Selected"),
                          Spacer(),
                          Icon(
                            Icons.event_seat_sharp,
                            color: Colors.grey,
                            size: 30,
                          ),
                          Text(" Seat Available"),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.event_seat_sharp,
                            color: Colors.red,
                            size: 30,
                          ),
                          Text(" Seat Unavailable"),
                          Spacer(),
                          Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 20, 0),
                              child: Image.asset(
                                "assets/images/steering.png",
                                width: 25,
                                fit: BoxFit.cover,
                              )),
                          Text(" Driver Seat"),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FullWidthButton(
                  title: "Proceed",
                  color: AppColors.primaryButtonColor,
                  onTap: () {
                    Get.to(() => PermitForm(selectPerson: widget.selectPerson));
                  },
                  margin: EdgeInsets.symmetric(horizontal: 45),
                  borderRadius: BorderRadius.circular(5),
                )
              ])));
  }
}
