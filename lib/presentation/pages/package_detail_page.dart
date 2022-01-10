import 'package:cab_booking/data/models/carousel_model.dart';
import 'package:cab_booking/presentation/constants/app_constants.dart';
import 'package:cab_booking/presentation/pages/shared_booking_list.dart';
import 'package:cab_booking/presentation/styles/app_colors.dart';
import 'package:cab_booking/presentation/styles/custom_text_style.dart';
import 'package:cab_booking/presentation/widgets/carousel_widget.dart';
import 'package:cab_booking/presentation/widgets/custom_text_widget.dart';
import 'package:cab_booking/presentation/widgets/full_width_button.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';
import 'full_booking_list.dart';

class PackageDetailPage extends StatefulWidget {
  String? id;
  String? name;
  String? image;
  String? image2;
  String? image3;
  String? discountPrice;
  String? vehicleType;
  PackageDetailPage({this.id,this.name,this.image,this.image2,this.image3,this.vehicleType,this.discountPrice});

  @override
  _PackageDetailPageState createState() => _PackageDetailPageState();
}

class _PackageDetailPageState extends State<PackageDetailPage> {
  String? _standard;
  String? _budget;
  String? _twoStar;
  String? _select;
  String? _selectPerson = "1";

  late List<CarouselModel> _carouselModel = [
    CarouselModel(imageUrl: "http://cabbooking.rumtektechnologies.com/admin/${widget.image}"),
    CarouselModel(imageUrl: "http://cabbooking.rumtektechnologies.com/admin/${widget.image}"),
    CarouselModel(imageUrl: "http://cabbooking.rumtektechnologies.com/admin/${widget.image}"),
  ];
  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2021),
        lastDate: DateTime(2022));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () async {
            if (await canLaunch("https://wa.me/+918570836629")) {
              await launch("https://wa.me/+918570836629");
            } else {
              throw Exception("Cannot launch the url");
            }
          },
          child: Padding(
              padding: EdgeInsets.all(2),
              child: Image.asset("assets/images/whatsapp.png")),
        ),
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
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget("Rate Chart for Gangtok Tour",
                      style: CustomTextStyle.boldMediumTextStyle(
                          color: Colors.black),
                      alignText: false,
                      textOverflow: null),
                  SizedBox(
                    height: 8,
                  ),
                  Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    border: TableBorder.all(color: Colors.grey),
                    children: [
                      TableRow(children: [
                        Text(
                          "Cab",
                          style: CustomTextStyle.ultraSmallBoldTextStyle(
                              color: Colors.black),
                        ),
                        Text(
                          "Hotels",
                          style: CustomTextStyle.ultraSmallBoldTextStyle(
                              color: Colors.black),
                        ),
                        Text("Shared",
                            style: CustomTextStyle.ultraSmallBoldTextStyle(
                                color: Colors.black)),
                        Text("Reserved",
                            style: CustomTextStyle.ultraSmallBoldTextStyle(
                                color: Colors.black))
                      ]),
                      TableRow(children: [
                        Text("Small",
                            style: CustomTextStyle.ultraSmallBoldTextStyle(
                                color: Colors.black)),
                        DropdownButton<String>(
                          isExpanded: true,
                          underline: SizedBox(),
                          hint: Text("Luxury",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              )),
                          items: <String>[
                            "Budget",
                            "Standard",
                            "2 Stars",
                            "3 Stars",
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _budget = newValue;
                            });
                          },
                          value: _budget,
                        ),
                        Text("N/A",
                            style: CustomTextStyle.ultraSmallBoldTextStyle(
                                color: Colors.red)),
                        (_budget == "Budget")
                            ? Text("2000")
                            : (_budget == "Standard")
                                ? Text("3000")
                                : (_budget == "2 Stars")
                                    ? Text("4000")
                                    : Text("5000")
                      ]),
                      TableRow(children: [
                        Text("Standard",
                            style: CustomTextStyle.ultraSmallBoldTextStyle(
                                color: Colors.black)),
                        DropdownButton<String>(
                          isExpanded: true,
                          underline: SizedBox(),
                          hint: Text("Luxury",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              )),
                          items: <String>[
                            "Budget",
                            "Standard",
                            "2 Stars",
                            "3 Stars",
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _standard = newValue;
                            });
                          },
                          value: _standard,
                        ),
                        Text("200"),

                        (_standard == "Budget")
                            ? Text("2000")
                            : (_standard == "Standard")
                                ? Text("3000")
                                : (_standard == "2 Stars")
                                    ? Text("4000")
                                    : Text("5000")
                      ]),
                      TableRow(children: [
                        Text("luxury",
                            style: CustomTextStyle.ultraSmallBoldTextStyle(
                                color: Colors.black)),
                        DropdownButton<String>(
                          isExpanded: true,
                          underline: SizedBox(),
                          hint: Text("Luxury",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              )),
                          items: <String>[
                            "Budget",
                            "Standard",
                            "2 Stars",
                            "3 Stars",
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _twoStar = newValue;
                            });
                          },
                          value: _twoStar,
                        ),
                        Text("800"),
                        (_twoStar == "Budget")
                            ? Text("4000")
                            : (_twoStar == "Standard")
                                ? Text("6000")
                                : (_twoStar == "2 Stars")
                                    ? Text("8000")
                                    : Text("10000")
                      ]),
                      TableRow(children: [
                        Text("Super",
                            style: CustomTextStyle.ultraSmallBoldTextStyle(
                                color: Colors.black)),
                        Text("Coming Soon!",
                            style: CustomTextStyle.ultraSmallBoldTextStyle(
                                color: Colors.green)),
                        Text("Coming Soon!",
                            style: CustomTextStyle.ultraSmallBoldTextStyle(
                                color: Colors.green)),
                        Text("Coming Soon!",
                            style: CustomTextStyle.ultraSmallBoldTextStyle(
                                color: Colors.green)),
                      ]),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.screenHorizontalPadding,
                  vertical: AppConstants.screenVerticalPadding),
              color: Colors.white,
              child: CustomTextWidget(
                widget.name.toString(),
                textOverflow: null,
                alignText: false,
                style: CustomTextStyle.boldMediumTextStyle(color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DefaultTabController(
                  length: 2,
                  child: Container(
                    height: 360,
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
                                    CustomTextWidget("Cities: ",
                                        style:
                                            CustomTextStyle.smallBoldTextStyle1(
                                                color: Colors.black),
                                        alignText: false,
                                        textOverflow: null),
                                    CustomTextWidget(
                                        "Lachung (1D) -> Lachen (1D)",
                                        style: CustomTextStyle.smallTextStyle1(
                                            color: Colors.black),
                                        alignText: false,
                                        textOverflow: null),
                                  ],
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: CustomTextWidget("2 Days 1 Night",
                                      style:
                                          CustomTextStyle.smallBoldTextStyle1(
                                              color: AppColors.primaryColor),
                                      alignText: false,
                                      textOverflow: null),
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
                                          setState(() {
                                            _selectPerson = newValue;
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
                                    CustomTextWidget("Seat Available",
                                        style: CustomTextStyle.mediumTextStyle(
                                            color: Colors.black),
                                        alignText: false,
                                        textOverflow: null),
                                    Spacer(),
                                    _select == "Small 4 Seats"
                                        ? CustomTextWidget("Only Reserved Available",
                                            style: CustomTextStyle
                                                .boldMediumTextStyle(
                                                    color: Colors.green),
                                            alignText: false,
                                            textOverflow: null)
                                        : _select == "Large 10 Seats"
                                            ? CustomTextWidget(
                                                "4 Seats Available",
                                                style: CustomTextStyle
                                                    .boldMediumTextStyle(
                                                        color: Colors.green),
                                                alignText: false,
                                                textOverflow: null)
                                            : _select == "Luxury 7 Seats"
                                                ? CustomTextWidget(
                                                    "2 Seats Available",
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
                                SizedBox(
                                  height: 20,
                                ),
                                MaterialButton(
                                    height: 40.0,
                                    minWidth: 300.0,
                                    color: Colors.deepOrangeAccent,
                                    textColor: Colors.white,
                                    child: new Text("Continue"),
                                    onPressed: () => {
                                          Get.defaultDialog(
                                            title: "Cancellation Policy",
                                            titleStyle: CustomTextStyle
                                                .boldMediumTextStyle(
                                                    color: AppColors
                                                        .primaryButtonColor),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 10),
                                            content: Column(
                                              children: [
                                                Divider(),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.close,
                                                      color: AppColors
                                                          .primaryColor,
                                                      size: 20,
                                                    ),
                                                    Flexible(
                                                        child: Text(
                                                      "5% Cancellation Charges, if cancelled online before 12 hours of Travel Time.",
                                                      style: CustomTextStyle
                                                          .ultraSmallTextStyle(
                                                              color:
                                                                  Colors.grey),
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
                                                      color: AppColors
                                                          .primaryColor,
                                                      size: 20,
                                                    ),
                                                    CustomTextWidget(
                                                      "No Refund within 12 hours of Travel Time.",
                                                      style: CustomTextStyle
                                                          .ultraSmallTextStyle(
                                                              color:
                                                                  Colors.grey),
                                                      textOverflow:
                                                          TextOverflow.ellipsis,
                                                      alignText: false,
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                            textConfirm: "PROCEED",
                                            buttonColor:
                                                AppColors.primaryButtonColor,
                                            confirmTextColor: Colors.white,
                                            confirm: FullWidthButton(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 30,
                                                    vertical: 10),
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 8),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                title: "PROCEED",
                                                color: AppColors
                                                    .primaryButtonColor,
                                                onTap: () {
                                                  Get.to(SharedBookingList(
                                                      selectPerson:
                                                          _selectPerson));
                                                }),
                                          )
                                        })
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
                                    CustomTextWidget("Cities: ",
                                        style:
                                            CustomTextStyle.smallBoldTextStyle1(
                                                color: Colors.black),
                                        alignText: false,
                                        textOverflow: null),
                                    CustomTextWidget(
                                        "Lachung (1D) -> Lachen (1D)",
                                        style: CustomTextStyle.smallTextStyle1(
                                            color: Colors.black),
                                        alignText: false,
                                        textOverflow: null),
                                  ],
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: CustomTextWidget("2 Days 1 Night",
                                      style:
                                          CustomTextStyle.smallBoldTextStyle1(
                                              color: AppColors.primaryColor),
                                      alignText: false,
                                      textOverflow: null),
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
                                    CustomTextWidget("Hotel Type",
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
                                        hint: Text("Budget",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            )),
                                        items: <String>[
                                          "Budget",
                                          "Standard",
                                          "2 Stars",
                                          "3 Stars"
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
                                SizedBox(height: 10,),
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
              color: Colors.white,
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.red.shade500,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.warning, color: Colors.white),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: CustomTextWidget(
                                "Please Note that Hotel booking is included in Shared Booking",
                                alignText: false,
                                textOverflow: null,
                                style: CustomTextStyle.smallBoldTextStyle1(
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.remove, color: Colors.white),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: CustomTextWidget(
                                "Standard vehicle sharing only provide Standard Hotels",
                                alignText: false,
                                textOverflow: null,
                                style: CustomTextStyle.smallBoldTextStyle1(
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.remove, color: Colors.white),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: CustomTextWidget(
                                "Luxury vehicle sharing only provide Luxury Hotels",
                                alignText: false,
                                textOverflow: null,
                                style: CustomTextStyle.smallBoldTextStyle1(
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  CustomTextWidget("Price Inclusive of",
                      style: CustomTextStyle.boldMediumTextStyle(
                          color: Colors.black),
                      alignText: false,
                      textOverflow: null),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.hotel,
                            color: Colors.grey.shade700,
                          ),
                          Text(
                            "Upto 3 Stars",
                            style: TextStyle(color: Colors.grey, fontSize: 11),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.flight,
                            color: Colors.grey.shade400,
                          ),
                          Text(
                            "Flights",
                            style: TextStyle(color: Colors.grey, fontSize: 11),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.restaurant,
                            color: Colors.grey.shade700,
                          ),
                          Text(
                            "Breakfast",
                            style: TextStyle(color: Colors.grey, fontSize: 11),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.directions_car,
                            color: Colors.grey.shade700,
                          ),
                          Text(
                            "Private Cab",
                            style: TextStyle(color: Colors.grey, fontSize: 11),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.screenHorizontalPadding,
                  vertical: AppConstants.screenVerticalPadding),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget("Points you Covered",
                      style: CustomTextStyle.boldMediumTextStyle(
                          color: Colors.black),
                      alignText: false,
                      textOverflow: null),
                  Row(
                    children: [
                      Flexible(
                        child: ReadMoreText(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                          style: CustomTextStyle.ultraSmallTextStyle(
                              color: Colors.black),
                          trimLines: 5,
                          trimMode: TrimMode.Line,
                          colorClickableText: Colors.blue,
                          trimCollapsedText: 'Read More',
                          moreStyle: CustomTextStyle.ultraSmallBoldTextStyle(
                              color: Colors.blue),
                          lessStyle: CustomTextStyle.ultraSmallBoldTextStyle(
                              color: Colors.blue),
                          trimExpandedText: 'Less',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            DefaultTabController(
                length: 2,
                child: Container(
                  height: 160,
                  child: Scaffold(
                    backgroundColor: Colors.white,
                    appBar: TabBar(
                      labelColor: Colors.deepOrangeAccent,
                      unselectedLabelColor: Colors.grey,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorColor: Colors.deepOrangeAccent,
                      tabs: [
                        Tab(
                            child: Text(
                          'Inclusions',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        )),
                        Tab(
                            child: Text(
                          'Exclusions',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        )),
                      ],
                    ),
                    body: TabBarView(
                      children: [
                        //  Shared Booking
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.add,
                                    size: 14,
                                    color: Colors.deepOrangeAccent,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Rooms on twin sharing basis',
                                    style: CustomTextStyle.ultraSmallTextStyle(
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.add,
                                    size: 14,
                                    color: Colors.deepOrangeAccent,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Daily Breakfast',
                                    style: CustomTextStyle.ultraSmallTextStyle(
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.add,
                                    size: 14,
                                    color: Colors.deepOrangeAccent,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Sightseeing as per the package',
                                    style: CustomTextStyle.ultraSmallTextStyle(
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.add,
                                    size: 14,
                                    color: Colors.deepOrangeAccent,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Driver for 12 hrs per day up to maximum 08:00 PM.',
                                    style: CustomTextStyle.ultraSmallTextStyle(
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.add,
                                    size: 14,
                                    color: Colors.deepOrangeAccent,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Luxury Taxes, Parking Fee, Driver Allowance etc',
                                    style: CustomTextStyle.ultraSmallTextStyle(
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        /////////////////////////// Exclusions /////////////////////////////////////
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.remove,
                                    size: 14,
                                    color: Colors.deepOrangeAccent,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Personal Expenses',
                                    style: CustomTextStyle.ultraSmallTextStyle(
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.remove,
                                    size: 14,
                                    color: Colors.deepOrangeAccent,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                      child: Text(
                                    'Additional Sightseeing or extra usage of vehicle, Camera fees, Guide charges and Entrance Fees.',
                                    style: CustomTextStyle.ultraSmallTextStyle(
                                        color: Colors.black),
                                  )),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.remove,
                                    size: 14,
                                    color: Colors.deepOrangeAccent,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Any cost arising due to situation beyond control',
                                    style: CustomTextStyle.ultraSmallTextStyle(
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.remove,
                                    size: 14,
                                    color: Colors.deepOrangeAccent,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Anything which is not included in the inclusion',
                                    style: CustomTextStyle.ultraSmallTextStyle(
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        )));
  }
}
