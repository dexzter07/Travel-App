import 'package:cab_booking/data/models/carousel_model.dart';
import 'package:cab_booking/presentation/constants/app_constants.dart';
import 'package:cab_booking/presentation/styles/custom_text_style.dart';
import 'package:cab_booking/presentation/widgets/carousel_widget.dart';
import 'package:cab_booking/presentation/widgets/custom_appbar.dart';
import 'package:cab_booking/presentation/widgets/custom_text_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

class DayDetailPage extends StatefulWidget {
  const DayDetailPage({Key? key}) : super(key: key);

  @override
  _DayDetailPageState createState() => _DayDetailPageState();
}

class _DayDetailPageState extends State<DayDetailPage> {
  String? _select;
  String? _selectPerson;
  List<CarouselModel> _carouselModel = [
    CarouselModel(imageUrl: "assets/images/day_tour/gangtok.jpg"),
    CarouselModel(imageUrl: "assets/images/day_tour/deorali.jpg"),
    CarouselModel(imageUrl: "assets/images/day_tour/changu.jpg"),
  ];
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
                  CustomTextWidget("Rate Chart for Gangtok Tour",
                      style: CustomTextStyle.boldMediumTextStyle(
                          color: Colors.black),
                      alignText: false,
                      textOverflow: null),
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
                        Text("Shared per person",
                            style: CustomTextStyle.ultraSmallBoldTextStyle(
                                color: Colors.black)),
                        Text("Reserved",
                            style: CustomTextStyle.ultraSmallBoldTextStyle(
                                color: Colors.black))
                      ]),
                      TableRow(children: [
                        Text("Small Vehicle",
                            style: CustomTextStyle.ultraSmallBoldTextStyle(
                                color: Colors.black)),
                        Text(
                          "N/A",
                            style: CustomTextStyle.ultraSmallBoldTextStyle(
                                color: Colors.red)
                        ),
                        Text("2000")
                      ]),
                      TableRow(children: [
                        Text("Standard Vehicle",
                            style: CustomTextStyle.ultraSmallBoldTextStyle(
                                color: Colors.black)),
                        Text(
                          "300",
                        ),
                        Text("3000")
                      ]),
                      TableRow(children: [
                        Text("luxury Vehicle",
                            style: CustomTextStyle.ultraSmallBoldTextStyle(
                                color: Colors.black)),
                        Text("N/A",
                            style: CustomTextStyle.ultraSmallBoldTextStyle(
                                color: Colors.redAccent)),
                        Text("4000")
                      ]),
                      TableRow(children: [
                        Text("Super Luxury",
                            style: CustomTextStyle.ultraSmallBoldTextStyle(
                                color: Colors.black)),
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
                                    CustomTextWidget("One Day Tour",
                                        style: CustomTextStyle.boldMediumTextStyle(
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
                                SizedBox(height: 10,),
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
                                      padding: EdgeInsets.symmetric(horizontal: 4),
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
                                SizedBox(height: 8,),
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
                                      padding: EdgeInsets.symmetric(horizontal: 4),
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
                                            style:
                                                CustomTextStyle.boldMediumTextStyle(
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
                                                            color: Colors.green),
                                                    alignText: false,
                                                    textOverflow: null)
                                                : CustomTextWidget("1200 /-",
                                                    style: CustomTextStyle
                                                        .boldMediumTextStyle(
                                                            color: Colors.green),
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
                                        ? CustomTextWidget(
                                            "Only Reserved Available",
                                            style:
                                                CustomTextStyle.boldMediumTextStyle(
                                                    color: Colors.green),
                                            alignText: false,
                                            textOverflow: null)
                                        : _select == "Large 10 Seats"
                                            ? CustomTextWidget("4 Seats Available",
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
                                                            color: Colors.green),
                                                    alignText: false,
                                                    textOverflow: null)
                                                : CustomTextWidget("Not Available",
                                                    style: CustomTextStyle
                                                        .boldMediumTextStyle(
                                                            color:
                                                                Colors.redAccent),
                                                    alignText: false,
                                                    textOverflow: null),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
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
                                  onPressed: () => {},
                                  splashColor: Colors.redAccent,
                                )
                              ],
                            ),
                          ),
                          //  Full Booking
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
                                Divider(),
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
                                      padding: EdgeInsets.symmetric(horizontal: 4),
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
                                            style:
                                                CustomTextStyle.boldMediumTextStyle(
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
                                                            color: Colors.green),
                                                    alignText: false,
                                                    textOverflow: null)
                                                : CustomTextWidget("1200 /-",
                                                    style: CustomTextStyle
                                                        .boldMediumTextStyle(
                                                            color: Colors.green),
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
                                        ? CustomTextWidget(
                                            "1 Available",
                                            style:
                                                CustomTextStyle.boldMediumTextStyle(
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
                                                            color: Colors.green),
                                                    alignText: false,
                                                    textOverflow: null)
                                                : CustomTextWidget("Not Available",
                                                    style: CustomTextStyle
                                                        .boldMediumTextStyle(
                                                            color:
                                                                Colors.redAccent),
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
                                  onPressed: () => {},
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
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
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