import 'package:cab_booking/logic/controllers/seat_avail_controller.dart';
import 'package:cab_booking/presentation/pages/checkout_page.dart';
import 'package:cab_booking/presentation/pages/permit_form.dart';
import 'package:cab_booking/presentation/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'full_width_button.dart';

class StandardCarWidget extends StatefulWidget {
  final String? selectPerson;
  const StandardCarWidget({Key? key, this.selectPerson}) : super(key: key);

  @override
  _StandardCarWidgetState createState() => _StandardCarWidgetState();
}

class _StandardCarWidgetState extends State<StandardCarWidget> {
  SeatAvailController _seatAvailController = Get.put(SeatAvailController());
  final list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Seat Selection"),
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
                        height: 430,
                        width: 280,
                      ),
                    ),
                    Positioned(
                      top: 210,
                      left: 110,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              _seatAvailController.booked.value == true
                                  ? InkWell(
                                      child: Icon(
                                      Icons.event_seat_sharp,
                                      color: Colors.red,
                                      size: 35,
                                    ))
                                  : InkWell(
                                      child: (_seatAvailController
                                                  .onPressed.value ==
                                              true
                                          ? Icon(
                                              Icons.event_seat_sharp,
                                              color: Colors.green,
                                              size: 35,
                                            )
                                          : Icon(
                                              Icons.event_seat_sharp,
                                              color: Colors.grey,
                                              size: 35,
                                            )),
                                      onTap: () {
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
                              _seatAvailController.booked1.value == true
                                  ? InkWell(
                                      child: Icon(
                                      Icons.event_seat_sharp,
                                      color: Colors.red,
                                      size: 35,
                                    ))
                                  : InkWell(
                                      child: (_seatAvailController
                                                  .onPressed1.value ==
                                              true
                                          ? Icon(
                                              Icons.event_seat_sharp,
                                              color: Colors.green,
                                              size: 35,
                                            )
                                          : Icon(
                                              Icons.event_seat_sharp,
                                              color: Colors.grey,
                                              size: 35,
                                            )),
                                      onTap: () {
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
                                width: 10,
                              ),
                              Container(
                                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Image.asset(
                                    "assets/images/steering.png",
                                    width: 30,
                                    fit: BoxFit.cover,
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _seatAvailController.booked2.value == true
                                  ? InkWell(
                                      child: Icon(
                                      Icons.event_seat_sharp,
                                      color: Colors.red,
                                      size: 35,
                                    ))
                                  : InkWell(
                                      child: (_seatAvailController
                                                  .onPressed2.value ==
                                              true
                                          ? Icon(
                                              Icons.event_seat_sharp,
                                              color: Colors.green,
                                              size: 35,
                                            )
                                          : Icon(
                                              Icons.event_seat_sharp,
                                              color: Colors.grey,
                                              size: 35,
                                            )),
                                      onTap: () {
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
                              _seatAvailController.booked3.value == true
                                  ? InkWell(
                                      child: Icon(
                                      Icons.event_seat_sharp,
                                      color: Colors.red,
                                      size: 35,
                                    ))
                                  : InkWell(
                                      child: (_seatAvailController
                                                  .onPressed3.value ==
                                              true
                                          ? Icon(
                                              Icons.event_seat_sharp,
                                              color: Colors.green,
                                              size: 35,
                                            )
                                          : Icon(
                                              Icons.event_seat_sharp,
                                              color: Colors.grey,
                                              size: 35,
                                            )),
                                      onTap: () {
                                        if (_seatAvailController
                                                .onPressed3.value ==
                                            true) {
                                          list.remove(_seatAvailController
                                              .seats2.value);
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
                              _seatAvailController.booked4.value == true
                                  ? InkWell(
                                      child: Icon(
                                      Icons.event_seat_sharp,
                                      color: Colors.red,
                                      size: 35,
                                    ))
                                  : InkWell(
                                      child: (_seatAvailController
                                                  .onPressed4.value ==
                                              true
                                          ? Icon(
                                              Icons.event_seat_sharp,
                                              color: Colors.green,
                                              size: 35,
                                            )
                                          : Icon(
                                              Icons.event_seat_sharp,
                                              color: Colors.grey,
                                              size: 35,
                                            )),
                                      onTap: () {
                                        if (_seatAvailController
                                                .onPressed4.value ==
                                            true) {
                                          list.remove(_seatAvailController
                                              .seats4.value);
                                          _seatAvailController
                                              .onPressed4.value = false;
                                        } else {
                                          _seatAvailController.seats4.value =
                                              "4";
                                          list.add(_seatAvailController
                                              .seats4.value);
                                          _seatAvailController
                                              .onPressed4.value = true;
                                        }
                                      }),
                              _seatAvailController.booked5.value == true
                                  ? InkWell(
                                      child: Icon(
                                      Icons.event_seat_sharp,
                                      color: Colors.red,
                                      size: 35,
                                    ))
                                  : InkWell(
                                      child: (_seatAvailController
                                                  .onPressed5.value ==
                                              true
                                          ? Icon(
                                              Icons.event_seat_sharp,
                                              color: Colors.green,
                                              size: 35,
                                            )
                                          : Icon(
                                              Icons.event_seat_sharp,
                                              color: Colors.grey,
                                              size: 35,
                                            )),
                                      onTap: () {
                                        if (_seatAvailController
                                                .onPressed5.value ==
                                            true) {
                                          list.remove(_seatAvailController
                                              .seats5.value);
                                          _seatAvailController
                                              .onPressed5.value = false;
                                        } else {
                                          _seatAvailController.seats5.value =
                                              "5";
                                          list.add(_seatAvailController
                                              .seats5.value);
                                          _seatAvailController
                                              .onPressed5.value = true;
                                        }
                                      }),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              _seatAvailController.booked6.value == true
                                  ? InkWell(
                                      child: Icon(
                                      Icons.event_seat_sharp,
                                      color: Colors.red,
                                      size: 35,
                                    ))
                                  : InkWell(
                                      child: (_seatAvailController
                                                  .onPressed6.value ==
                                              true
                                          ? Icon(
                                              Icons.event_seat_sharp,
                                              color: Colors.green,
                                              size: 35,
                                            )
                                          : Icon(
                                              Icons.event_seat_sharp,
                                              color: Colors.grey,
                                              size: 35,
                                            )),
                                      onTap: () {
                                        if (_seatAvailController
                                                .onPressed6.value ==
                                            true) {
                                          list.remove(_seatAvailController
                                              .seats6.value);
                                          _seatAvailController
                                              .onPressed6.value = false;
                                        } else {
                                          _seatAvailController.seats6.value =
                                              "5";
                                          list.add(_seatAvailController
                                              .seats6.value);
                                          _seatAvailController
                                              .onPressed6.value = true;
                                        }
                                      }),
                              _seatAvailController.booked6.value == true
                                  ? InkWell(
                                      child: Icon(
                                      Icons.event_seat_sharp,
                                      color: Colors.red,
                                      size: 35,
                                    ))
                                  : InkWell(
                                      child: (_seatAvailController
                                                  .onPressed7.value ==
                                              true
                                          ? Icon(
                                              Icons.event_seat_sharp,
                                              color: Colors.green,
                                              size: 35,
                                            )
                                          : Icon(
                                              Icons.event_seat_sharp,
                                              color: Colors.grey,
                                              size: 35,
                                            )),
                                      onTap: () {
                                        if (_seatAvailController
                                                .onPressed7.value ==
                                            true) {
                                          list.remove(_seatAvailController
                                              .seats7.value);
                                          _seatAvailController
                                              .onPressed7.value = false;
                                        } else {
                                          _seatAvailController.seats7.value =
                                              "7";
                                          list.add(_seatAvailController
                                              .seats7.value);
                                          _seatAvailController
                                              .onPressed7.value = true;
                                        }
                                      }),
                              _seatAvailController.booked8.value == true
                                  ? InkWell(
                                      child: Icon(
                                      Icons.event_seat_sharp,
                                      color: Colors.red,
                                      size: 35,
                                    ))
                                  : InkWell(
                                      child: (_seatAvailController
                                                  .onPressed8.value ==
                                              true
                                          ? Icon(
                                              Icons.event_seat_sharp,
                                              color: Colors.green,
                                              size: 35,
                                            )
                                          : Icon(
                                              Icons.event_seat_sharp,
                                              color: Colors.grey,
                                              size: 35,
                                            )),
                                      onTap: () {
                                        if (_seatAvailController
                                                .onPressed8.value ==
                                            true) {
                                          list.remove(_seatAvailController
                                              .seats8.value);
                                          _seatAvailController
                                              .onPressed8.value = false;
                                        } else {
                                          _seatAvailController.seats8.value =
                                              "8";
                                          list.add(_seatAvailController
                                              .seats8.value);
                                          _seatAvailController
                                              .onPressed8.value = true;
                                        }
                                      }),
                              _seatAvailController.booked9.value == true
                                  ? InkWell(
                                      child: Icon(
                                      Icons.event_seat_sharp,
                                      color: Colors.red,
                                      size: 35,
                                    ))
                                  : InkWell(
                                      child: (_seatAvailController
                                                  .onPressed9.value ==
                                              true
                                          ? Icon(
                                              Icons.event_seat_sharp,
                                              color: Colors.green,
                                              size: 35,
                                            )
                                          : Icon(
                                              Icons.event_seat_sharp,
                                              color: Colors.grey,
                                              size: 35,
                                            )),
                                      onTap: () {
                                        if (_seatAvailController
                                                .onPressed9.value ==
                                            true) {
                                          list.remove(_seatAvailController
                                              .seats9.value);
                                          _seatAvailController
                                              .onPressed9.value = false;
                                        } else {
                                          _seatAvailController.seats9.value =
                                              "9";
                                          list.add(_seatAvailController
                                              .seats9.value);
                                          _seatAvailController
                                              .onPressed9.value = true;
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
                  onTap: () async {
                    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                    var permit = sharedPreferences.getString("permit");
                    print(list);
                    if(permit == "0"){
                      Get.to(() => CheckoutPage());
                    }
                    else {
                      Get.to(() =>
                          PermitForm(selectPerson: widget.selectPerson));
                    }
                  },
                  margin: EdgeInsets.symmetric(horizontal: 45),
                  borderRadius: BorderRadius.circular(5),
                )
              ])));
  }
}
