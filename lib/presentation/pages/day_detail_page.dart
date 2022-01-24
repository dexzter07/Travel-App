import 'package:cab_booking/data/models/carousel_model.dart';
import 'package:cab_booking/logic/controllers/day_tour_rate_chart_controller.dart';
import 'package:cab_booking/logic/controllers/shared_booking_controller.dart';
import 'package:cab_booking/presentation/pages/shared_booking_list.dart';
import 'package:cab_booking/presentation/styles/custom_text_style.dart';
import 'package:cab_booking/presentation/widgets/carousel_widget.dart';
import 'package:cab_booking/presentation/widgets/custom_text_widget.dart';
import 'package:cab_booking/presentation/widgets/day_tour_rate_chart_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

import 'full_booking_list.dart';

class DayDetailPage extends StatefulWidget {
  String? id;
  String? name;
  String? image;
  String? image2;
  String? image3;
  String? discountPrice;
  String? vehicleType;
  String? pointsCovered;
  DayDetailPage(
      {this.id,
      this.name,
      this.image,
      this.image2,
      this.image3,
      this.discountPrice,
      this.vehicleType,
      this.pointsCovered});

  @override
  _DayDetailPageState createState() => _DayDetailPageState();
}

class _DayDetailPageState extends State<DayDetailPage> {
  DayTourRateController _dayTourRateController =
      Get.put(DayTourRateController());
  SharedBookingController _sharedBookingController =
      Get.put(SharedBookingController());

  String? _select;
  String? _selectPerson = "1";
  late List<CarouselModel> _carouselModel = [
    CarouselModel(
        imageUrl:
            "http://cabbooking.rumtektechnologies.com/admin/${widget.image}"),
    CarouselModel(
        imageUrl:
            "http://cabbooking.rumtektechnologies.com/admin/${widget.image2}"),
    CarouselModel(
        imageUrl:
            "http://cabbooking.rumtektechnologies.com/admin/${widget.image3}"),
  ];
  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.deepOrangeAccent, // header background color
              onPrimary: Colors.white, // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.deepOrangeAccent, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 7)),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        _sharedBookingController.travelDate.value = selectedDate.toString();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () async {
          if (await canLaunch("https://wa.me/+918570836629")) {
            await launch("https://wa.me/+918570836629");
          } else {
            throw Exception("Cannot lanch the url");
          }
        },
        child: Padding(
            padding: EdgeInsets.all(2),
            child: Image.asset("assets/images/whatsapp.png")),
      ),
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: ListView(
          children: [
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(7))),
                child: CarouselSlider(
                  items: _carouselModel
                      .map((e) => CustomCarousel(
                            image: e,
                          ))
                      .toList(),
                  options: CarouselOptions(
                    autoPlay: true,
                    viewportFraction: 1,
                  ),
                )),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget("Rate Chart for ${widget.name}",
                      style: CustomTextStyle.boldMediumTextStyle(
                          color: Colors.black),
                      alignText: false,
                      textOverflow: TextOverflow.ellipsis),
                  SizedBox(
                    height: 8,
                  ),
                  Table(
                    border: TableBorder.all(color: Colors.grey),
                    children: [
                      TableRow(children: [
                        Text(
                          "Cab",
                          style: CustomTextStyle.ultraSmallBoldTextStyle(
                              color: Colors.black),
                        ),
                        Text("Shared",
                            style: CustomTextStyle.ultraSmallBoldTextStyle(
                                color: Colors.black)),
                        Text("Booking",
                            style: CustomTextStyle.ultraSmallBoldTextStyle(
                                color: Colors.black))
                      ]),
                    ],
                  ),
                  Obx(
                    () => _dayTourRateController.isLoading.value == true
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: _dayTourRateController
                                .dayTourRateChartList.length,
                            itemBuilder: (context, index) {
                              return DayTourRateChartWidget(
                                dayRateChartModel: _dayTourRateController
                                    .dayTourRateChartList[index],
                              );
                            }),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DefaultTabController(
                  length: 2,
                  child: Container(
                    height: 340,
                    child: Scaffold(
                      backgroundColor: Colors.deepOrange,
                      appBar: TabBar(
                        labelColor: Colors.white,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: Colors.deepOrangeAccent,
                        tabs: [
                          Tab(
                              child: Text(
                            'Shared Booking',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          )),
                          Tab(
                              child: Text(
                            'Reserved Booking',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          )),
                        ],
                      ),
                      body: TabBarView(
                        children: [
                          //  Shared Booking
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 0),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    CustomTextWidget("One Day Tour",
                                        style:
                                            CustomTextStyle.boldMediumTextStyle(
                                                color: Colors.black),
                                        alignText: false,
                                        textOverflow: null),
                                    CustomTextWidget("- Shared Booking",
                                        style: CustomTextStyle.smallTextStyle1(
                                            color: Colors.grey),
                                        alignText: false,
                                        textOverflow: null),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    CustomTextWidget("Total No. of Person",
                                        style: CustomTextStyle.mediumTextStyle(
                                            color: Colors.black),
                                        alignText: false,
                                        textOverflow: null),
                                    Spacer(),
                                    Container(
                                      height: 30,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade300)),
                                      child: DropdownButton<String>(
                                        isExpanded: false,
                                        underline: SizedBox(),
                                        menuMaxHeight: 400,
                                        hint: Text("1",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            )),
                                        items: <String>[
                                          "1",
                                          "2",
                                          "3",
                                          "4",
                                          "5",
                                          "6",
                                          "7",
                                          "8",
                                          "9",
                                          "10",
                                        ].map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: new Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (newValue) {
                                          _sharedBookingController
                                              .addDataAndFetch();
                                          setState(() {
                                            _selectPerson = newValue;
                                            _sharedBookingController
                                                    .numOfPerson.value =
                                                _selectPerson.toString();
                                          });
                                        },
                                        value: _selectPerson,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                InkWell(
                                  onTap: () => _selectDate(context),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CustomTextWidget("Travel Date",
                                          style:
                                              CustomTextStyle.mediumTextStyle(
                                                  color: Colors.black),
                                          alignText: false,
                                          textOverflow: null),
                                      Spacer(),
                                      Icon(
                                        Icons.calendar_today,
                                        size: 17,
                                      ),
                                      Text(
                                        "${selectedDate.toLocal()}"
                                            .split(' ')[0],
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color.fromRGBO(1, 1, 1, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    CustomTextWidget("Select Vehicle",
                                        style: CustomTextStyle.mediumTextStyle(
                                            color: Colors.black),
                                        alignText: false,
                                        textOverflow: null),
                                    Spacer(),
                                    Container(
                                      height: 30,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade300)),
                                      child: DropdownButton<String>(
                                        isExpanded: false,
                                        underline: SizedBox(),
                                        borderRadius: BorderRadius.circular(20),
                                        hint: Text(
                                            _sharedBookingController
                                                .vehicleType.value,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            )),
                                        items: <String>[
                                          "Small",
                                          "Standard",
                                          "Luxury",
                                          "Super Luxury"
                                        ].map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: new Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (newVal) {
                                          setState(() {
                                            _sharedBookingController.vehicleType
                                                .value = newVal.toString();
                                          });
                                          _sharedBookingController
                                              .addDataAndFetch();
                                        },
                                        value: _sharedBookingController
                                            .vehicleType.value,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Obx(
                                  () => _sharedBookingController
                                              .isLoading.value ==
                                          true
                                      ? Center(
                                          child: Text(
                                          "Please wait...",
                                          style: TextStyle(color: Colors.grey),
                                        ))
                                      : Column(
                                          children: [
                                            Row(
                                              children: [
                                                CustomTextWidget("Price",
                                                    style: CustomTextStyle
                                                        .mediumTextStyle(
                                                            color:
                                                                Colors.black),
                                                    alignText: false,
                                                    textOverflow: null),
                                                Spacer(),
                                                CustomTextWidget(
                                                    "₹ ${_sharedBookingController.price.value}",
                                                    style: CustomTextStyle
                                                        .boldMediumTextStyle(
                                                            color:
                                                                Colors.green),
                                                    alignText: false,
                                                    textOverflow: null),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                CustomTextWidget(
                                                    "Seat Available",
                                                    style: CustomTextStyle
                                                        .mediumTextStyle(
                                                            color:
                                                                Colors.black),
                                                    alignText: false,
                                                    textOverflow: null),
                                                Spacer(),
                                                _sharedBookingController
                                                            .seatAvail.value ==
                                                        ""
                                                    ? CustomTextWidget(
                                                        "Not Available",
                                                        style: CustomTextStyle
                                                            .boldMediumTextStyle(
                                                                color: Colors
                                                                    .redAccent),
                                                        alignText: false,
                                                        textOverflow: null)
                                                    : CustomTextWidget(
                                                        "${_sharedBookingController.seatAvail.value} Available",
                                                        style: CustomTextStyle
                                                            .boldMediumTextStyle(
                                                                color: Colors
                                                                    .green),
                                                        alignText: false,
                                                        textOverflow: null),
                                              ],
                                            ),
                                          ],
                                        ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                               Obx(() => _sharedBookingController.seatAvail.value == "" ? SizedBox(): MaterialButton(
                                  height: 40.0,
                                  minWidth: 300.0,
                                  color: Colors.deepOrangeAccent,
                                  textColor: Colors.white,
                                  child: new Text("Continue"),
                                  onPressed: () => {
                                    Get.to(() => SharedBookingList(
                                        selectPerson: _selectPerson))
                                  },
                                  splashColor: Colors.redAccent,
                                ))
                              ],
                            ),
                          ),

                          /////////////////////////// Full Booking /////////////////////////////////////
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 0),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    CustomTextWidget("One Day Tour",
                                        style: CustomTextStyle.appBarTextStyle(
                                            color: Colors.black),
                                        alignText: false,
                                        textOverflow: null),
                                    CustomTextWidget("- Reserved Booking",
                                        style: CustomTextStyle.smallTextStyle1(
                                            color: Colors.grey),
                                        alignText: false,
                                        textOverflow: null),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                InkWell(
                                  onTap: () => _selectDate(context),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CustomTextWidget("Travel Date",
                                          style:
                                              CustomTextStyle.mediumTextStyle(
                                                  color: Colors.black),
                                          alignText: false,
                                          textOverflow: null),
                                      Spacer(),
                                      Icon(
                                        Icons.calendar_today,
                                        size: 17,
                                      ),
                                      Text(
                                        "${selectedDate.toLocal()}"
                                            .split(' ')[0],
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color.fromRGBO(1, 1, 1, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    CustomTextWidget("Select Vehicle",
                                        style: CustomTextStyle.mediumTextStyle(
                                            color: Colors.black),
                                        alignText: false,
                                        textOverflow: null),
                                    Spacer(),
                                    Container(
                                      height: 30,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade300)),
                                      child: DropdownButton<String>(
                                        isExpanded: false,
                                        underline: SizedBox(),
                                        borderRadius: BorderRadius.circular(20),
                                        hint: Text("Luxury 7 Seats",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            )),
                                        items: <String>[
                                          "Small 4 Seats",
                                          "Large 10 Seats",
                                          "Luxury 7 Seats",
                                          "Super Luxury 4 Seats"
                                        ].map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: new Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (newVal) {
                                          setState(() {
                                            _select = newVal;
                                          });
                                        },
                                        value: _select,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    CustomTextWidget("Price",
                                        style: CustomTextStyle.mediumTextStyle(
                                            color: Colors.black),
                                        alignText: false,
                                        textOverflow: null),
                                    Spacer(),
                                    _select == "Small 4 Seats"
                                        ? CustomTextWidget("1000 /-",
                                            style: CustomTextStyle
                                                .boldMediumTextStyle(
                                                    color: Colors.green),
                                            alignText: false,
                                            textOverflow: null)
                                        : _select == "Large 10 Seats"
                                            ? CustomTextWidget("500 /-",
                                                style: CustomTextStyle
                                                    .boldMediumTextStyle(
                                                        color: Colors.green),
                                                alignText: false,
                                                textOverflow: null)
                                            : _select == "Luxury 7 Seats"
                                                ? CustomTextWidget("800 /-",
                                                    style: CustomTextStyle
                                                        .boldMediumTextStyle(
                                                            color:
                                                                Colors.green),
                                                    alignText: false,
                                                    textOverflow: null)
                                                : CustomTextWidget("1200 /-",
                                                    style: CustomTextStyle
                                                        .boldMediumTextStyle(
                                                            color:
                                                                Colors.green),
                                                    alignText: false,
                                                    textOverflow: null),
                                    CustomTextWidget(" per person",
                                        style: CustomTextStyle.mediumTextStyle(
                                            color: Colors.grey),
                                        alignText: false,
                                        textOverflow: null),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    CustomTextWidget("Cab Available",
                                        style: CustomTextStyle.mediumTextStyle(
                                            color: Colors.black),
                                        alignText: false,
                                        textOverflow: null),
                                    Spacer(),
                                    _select == "Small 4 Seats"
                                        ? CustomTextWidget("1 Available",
                                            style: CustomTextStyle
                                                .boldMediumTextStyle(
                                                    color: Colors.green),
                                            alignText: false,
                                            textOverflow: null)
                                        : _select == "Large 10 Seats"
                                            ? CustomTextWidget("4 Available",
                                                style: CustomTextStyle
                                                    .boldMediumTextStyle(
                                                        color: Colors.green),
                                                alignText: false,
                                                textOverflow: null)
                                            : _select == "Luxury 7 Seats"
                                                ? CustomTextWidget(
                                                    "2 Available",
                                                    style: CustomTextStyle
                                                        .boldMediumTextStyle(
                                                            color:
                                                                Colors.green),
                                                    alignText: false,
                                                    textOverflow: null)
                                                : CustomTextWidget(
                                                    "Not Available",
                                                    style: CustomTextStyle
                                                        .boldMediumTextStyle(
                                                            color: Colors
                                                                .redAccent),
                                                    alignText: false,
                                                    textOverflow: null),
                                  ],
                                ),
                                // SizedBox(
                                //   height: 20,
                                // ),
                                // Row(
                                //   children: [
                                //     CustomTextWidget("Total No. of Person",
                                //         style: CustomTextStyle.mediumTextStyle(
                                //             color: Colors.black),
                                //         alignText: false,
                                //         textOverflow: null),
                                //     Spacer(),
                                //     Container(
                                //       height: 30,
                                //       padding: EdgeInsets.symmetric(horizontal: 4),
                                //       decoration: BoxDecoration(
                                //           border: Border.all(
                                //               color: Colors.grey.shade300)),
                                //       child: DropdownButton<String>(
                                //         isExpanded: false,
                                //         underline: SizedBox(),
                                //         menuMaxHeight: 400,
                                //         hint: Text("1",
                                //             style: TextStyle(
                                //               fontWeight: FontWeight.w500,
                                //               fontSize: 14,
                                //             )),
                                //         items: <String>[
                                //           "1",
                                //           "2",
                                //           "3",
                                //           "4",
                                //           "5",
                                //           "6",
                                //           "7",
                                //           "8",
                                //           "9",
                                //           "10",
                                //         ].map((String value) {
                                //           return DropdownMenuItem<String>(
                                //             value: value,
                                //             child: new Text(value),
                                //           );
                                //         }).toList(),
                                //         onChanged: (newValue) {
                                //           setState(() {
                                //             _selectPerson = newValue;
                                //           });
                                //         },
                                //         value: _selectPerson,
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                SizedBox(
                                  height: 30,
                                ),
                                MaterialButton(
                                  height: 40.0,
                                  minWidth: 300.0,
                                  color: Colors.deepOrangeAccent,
                                  textColor: Colors.white,
                                  child: new Text("Continue"),
                                  onPressed: () => {Get.to(FullBookingList())},
                                  splashColor: Colors.redAccent,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              padding: EdgeInsets.all(8),
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      CustomTextWidget("Points you Covered",
                          style: CustomTextStyle.boldMediumTextStyle(
                              color: Colors.black),
                          alignText: false,
                          textOverflow: null),
                      Spacer(),
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: ReadMoreText(
                          "${widget.pointsCovered}",
                          style: CustomTextStyle.smallTextStyle1(
                              color: Colors.grey),
                          trimLines: 3,
                          trimMode: TrimMode.Line,
                          colorClickableText: Colors.deepOrangeAccent,
                          trimCollapsedText: 'Read More',
                          trimExpandedText: 'Less',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.directions_car,
                        color: Colors.deepOrangeAccent,
                        size: 30,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
