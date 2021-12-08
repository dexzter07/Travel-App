import 'package:cab_booking/presentation/pages/permit_form.dart';
import 'package:cab_booking/presentation/styles/app_colors.dart';
import 'package:cab_booking/presentation/widgets/full_width_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarWidget extends StatefulWidget {
  final String? selectPerson;
  const CarWidget({this.selectPerson});

  @override
  _CarWidgetState createState() => _CarWidgetState();
}

class _CarWidgetState extends State<CarWidget> {
  final List = [];

  bool booked = true;
  int? seats;
  bool onPressed = false;
  int? seats1;
  bool onPressed1 = false;
  int? seats2;
  bool onPressed2 = false;
  int? seats3;
  bool onPressed3 = false;
  int? seats4;
  bool onPressed4 = false;
  int? seats5;
  bool onPressed5 = false;
  int? seats6;
  bool onPressed6 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Seat Selection"),
        backgroundColor: AppColors.primaryColor,
      ),
        body: ListView(children: [
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
            left: 110,
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        icon: (onPressed1
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
                          setState(() {
                            if (onPressed1) {
                              List.remove(seats1);
                              onPressed1 = false;
                            } else {
                              seats1 = 1;
                              List.add(seats1);
                              onPressed1 = true;
                            }
                          });
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
                    IconButton(
                        icon: (onPressed2
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
                          setState(() {
                            if (onPressed2) {
                              List.remove(seats2);
                              onPressed2 = false;
                            } else {
                              seats2 = 2;
                              List.add(seats2);
                              onPressed2 = true;
                            }
                          });
                        }),
                    SizedBox(
                      width: 5,
                    ),
                    IconButton(
                        icon: (onPressed3
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
                          setState(() {
                            if (onPressed3) {
                              List.remove(seats3);
                              onPressed3 = false;
                            } else {
                              seats3 = 3;
                              List.add(seats3);
                              onPressed3 = true;
                            }
                          });
                        }),
                    SizedBox(
                      width: 5,
                    ),
                    IconButton(
                        icon: (onPressed
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
                          setState(() {
                            if (onPressed) {
                              List.remove(seats);
                              onPressed = false;
                            } else {
                              seats = 4;
                              List.add(seats);
                              onPressed = true;
                            }
                          });
                        }),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    IconButton(
                        icon: (onPressed4
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
                          setState(() {
                            if (onPressed4) {
                              List.remove(seats4);
                              onPressed4 = false;
                            } else {
                              seats4 = 5;
                              List.add(seats4);
                              onPressed4 = true;
                            }
                          });
                        }),
                    SizedBox(
                      width: 5,
                    ),
                    IconButton(
                        icon: (onPressed5
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
                          setState(() {
                            if (onPressed5) {
                              List.remove(seats5);
                              onPressed5 = false;
                            } else {
                              seats5 = 6;
                              List.add(seats5);
                              onPressed5 = true;
                            }
                          });
                        }),
                    SizedBox(
                      width: 5,
                    ),
                    IconButton(
                        icon: (onPressed6
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
                          setState(() {
                            if (onPressed6) {
                              List.remove(seats6);
                              onPressed6 = false;
                            } else {
                              seats6 = 7;
                              List.add(seats6);
                              onPressed6 = true;
                            }
                          });
                        }),
                  ],
                )
              ],
            ),
          )
        ],
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
      SizedBox(height: 20,),
      FullWidthButton(
        title: "Proceed",
        color: AppColors.primaryButtonColor,
        onTap: () {
          Get.to(() => PermitForm(selectPerson: widget.selectPerson));
        },
        margin: EdgeInsets.symmetric(horizontal: 45),
        borderRadius: BorderRadius.circular(5),

      )
    ]));
  }
}
