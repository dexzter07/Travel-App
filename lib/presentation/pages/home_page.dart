import 'package:cab_booking/data/models/car_category_model.dart';
import 'package:cab_booking/data/models/day_tour_model.dart';
import 'package:cab_booking/presentation/constants/app_constants.dart';
import 'package:cab_booking/presentation/styles/custom_text_style.dart';
import 'package:cab_booking/presentation/widgets/custom_inkwell.dart';
import 'package:cab_booking/presentation/widgets/custom_silver_grid_delegate.dart';
import 'package:cab_booking/presentation/widgets/custom_text_widget.dart';
import 'package:cab_booking/presentation/widgets/day_tour_widget.dart';
import 'package:cab_booking/presentation/widgets/product_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProductModel> _productList = [
    ProductModel(imageUrl: "assets/images/car_category/bolero.png",title: "Standard Vehicle",subTitle: "10 Seats",desc: "Scoprio, Bolero, Tata Sumo"),
    ProductModel(imageUrl: "assets/images/car_category/mahi-xylo.png",title: "Luxury Vehicle",subTitle: "7 Seats",desc: "Xylo, Innova"),

  ];
  List<ProductModel> _productList1 = [
    ProductModel(imageUrl: "assets/images/car_category/wagonr.png",title: "Small Vehicle",subTitle: "4 Seats",desc: "Wagon-R, Swift, Kwid, etc."),
    ProductModel(imageUrl: "assets/images/car_category/fortuner.png",title: "Super Luxury Vehicle",subTitle: "",desc: "Coming Soon!"),

  ];
  List<DayTourModel> _dayTourList = [
    DayTourModel(imageUrl: "assets/images/day_tour/gangtok.jpg",title: "Gangtok Sight Seeing", price: "1200 /- per person"),
    DayTourModel(imageUrl: "assets/images/day_tour/changu.jpg",title: "Tsongmo Lake", price: "1000 /- per person"),
    DayTourModel(imageUrl: "assets/images/day_tour/ranka.jpg",title: "Ranka Monastry", price: "900 /- per person"),
    DayTourModel(imageUrl: "assets/images/day_tour/namchi.jpg",title: "Namchi Chardham", price: "2000 /- per person"),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: ()async{
          if (await canLaunch("https://wa.me/+918570836629")){
            await launch("https://wa.me/+918570836629");
          }
          else{
            throw Exception("Cannot lanch the url");
          }
        },
        child: Padding(
            padding: EdgeInsets.all(2),
            child: Image.asset("assets/images/whatsapp.png")),
      ),
      body: SafeArea(
      child: Container(
        child: ListView(
          children: [
            Stack(clipBehavior: Clip.none, children: [
              Image.asset(
                "assets/images/lachung.jpg",
                fit: BoxFit.cover,
                height: 180,
                width: 400,
              ),
              new Positioned(
                  width: 390,
                  top: 60,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppConstants.screenHorizontalPadding,
                        vertical: AppConstants.screenVerticalPadding),
                    child: Column(
                      children: [
                        CustomTextWidget("Book Your Cab",
                            style: CustomTextStyle.boldTextStyle(
                                color: Colors.white),
                            alignText: true,
                            textOverflow: null),


                      ],
                    ),
                  ))
            ]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextWidget("What type of Vehicle we Provides...",textOverflow: null, style: CustomTextStyle.appBarTextStyle(color: Colors.black54), alignText: false,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        colors: [
                          Color.fromRGBO(251 ,215,134, 1),
                          Color.fromRGBO(247 ,121,125, 1),
                        ]
                    )
                ),
                child: Column(
                  children: [
                    SizedBox(height: 8,),
                    CustomTextWidget("Sharing | Reserved",
                        style: CustomTextStyle.boldMediumTextStyle(
                            color: Colors.white),
                        alignText: true,
                        textOverflow: null),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: GridView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                            crossAxisCount: 2,
                            height: 140.0,
                          ),
                          itemCount: _productList.length,
                          itemBuilder: (context,index){
                            return ProductWidget(productModel: _productList[index],);
                          }
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        colors: [

                          Color.fromRGBO(251 ,215,134, 1),
                          Color.fromRGBO(247 ,121,125, 1),
                        ]
                    )
                ),
                child: Column(
                  children: [
                    SizedBox(height: 8,),
                    CustomTextWidget("Reserved",
                        style: CustomTextStyle.boldMediumTextStyle(
                            color: Colors.white),
                        alignText: true,
                        textOverflow: null),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: GridView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                            crossAxisCount: 2,
                            height: 140.0,
                          ),
                          itemCount: _productList1.length,
                          itemBuilder: (context,index){
                            return ProductWidget(productModel: _productList1[index],);
                          }
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.screenHorizontalPadding,
                  vertical: AppConstants.screenVerticalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextWidget(
                    "Day Tour",
                    style: CustomTextStyle.appBarTextStyle(
                        color: Colors.black54),
                    alignText: false,
                    textOverflow: null,
                  ),
                  InkWell(
                      onTap: () {

                      },
                      child: Text(
                        "View All",
                        style: CustomTextStyle.ultraSmallBoldTextStyle(
                            color: Colors.blueAccent),
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GridView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                    crossAxisCount: 2,
                    height: 235.0,
                  ),
                  itemCount: _dayTourList.length,
                  itemBuilder: (context,index){
                    return DayTourWidget(dayTourModel: _dayTourList[index],);
                  }
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.screenHorizontalPadding,
                  vertical: AppConstants.screenVerticalPadding),
              child: Row(

                children: [
                  CustomTextWidget(
                    "Package Tour",
                    style: CustomTextStyle.appBarTextStyle(
                        color: Colors.black54),
                    alignText: false,
                    textOverflow: null,
                  ),
                  CustomTextWidget(
                    " - with/without Hotel",
                    style: CustomTextStyle.smallTextStyle1(
                        color: Colors.grey),
                    alignText: false,
                    textOverflow: null,
                  ),
                  Spacer(),
                  CustomInkWell(
                      onTap: () {},
                      child: Text(
                        "View All",
                        style: CustomTextStyle.ultraSmallBoldTextStyle(
                            color: Colors.blueAccent),
                      ))
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(
                horizontal: AppConstants.screenHorizontalPadding,
              ),
              child: Row(
                children: [
                  Card(
                    child: Container(
                      padding: EdgeInsets.only(left: 8),
                      width: 280,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/images/lachung.jpg",
                            fit: BoxFit.cover,
                            width: 270,
                            height: 150,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomTextWidget(
                            "Lachung & Lachen 1 Night 2 Days",
                            style: CustomTextStyle.smallBoldTextStyle1(
                              color: Colors.grey.shade800,
                            ),
                            alignText: false,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "Starting from",
                            style: TextStyle(color: Colors.grey, fontSize: 11),
                          ),
                          Row(
                            children: [
                              Text(
                                "₹ 5000/-",
                                style: CustomTextStyle.smallBoldTextStyle1(
                                    color: Colors.green),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "₹ 7000/-",
                                style: CustomTextStyle.smallTextStyle1(
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                          Text(
                            "Per Person",
                            style: TextStyle(color: Colors.grey, fontSize: 11),
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
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 11),
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
                                    "Flight",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 11),
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
                                    "Meals",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 11),
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
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 11),
                                  )
                                ],
                              ),
                            ],
                          ),
                          MaterialButton(
                            height: 30.0,
                            minWidth: 270.0,
                            color: Colors.deepOrangeAccent,
                            textColor: Colors.white,
                            child: new Text("View Details"),
                            onPressed: () => {},
                            splashColor: Colors.redAccent,
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      padding: EdgeInsets.only(left: 8),
                      width: 280,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/images/lachung.jpg",
                            fit: BoxFit.cover,
                            width: 270,
                            height: 150,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomTextWidget(
                            "Lachung & Lachen 1 Night 2 Days",
                            style: CustomTextStyle.smallBoldTextStyle1(
                              color: Colors.grey.shade800,
                            ),
                            alignText: false,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "Starting from",
                            style: TextStyle(color: Colors.grey, fontSize: 11),
                          ),
                          Row(
                            children: [
                              Text(
                                "₹ 5000/-",
                                style: CustomTextStyle.smallBoldTextStyle1(
                                    color: Colors.green),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "₹ 7000/-",
                                style: CustomTextStyle.smallTextStyle1(
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                          Text(
                            "Per Person",
                            style: TextStyle(color: Colors.grey, fontSize: 11),
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
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 11),
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
                                    "Flight",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 11),
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
                                    "Meals",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 11),
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
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 11),
                                  )
                                ],
                              ),
                            ],
                          ),
                          MaterialButton(
                            height: 30.0,
                            minWidth: 270.0,
                            color: Colors.deepOrangeAccent,
                            textColor: Colors.white,
                            child: new Text("View Details"),
                            onPressed: () => {},
                            splashColor: Colors.redAccent,
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      padding: EdgeInsets.only(left: 8),
                      width: 280,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/images/lachung.jpg",
                            fit: BoxFit.cover,
                            width: 270,
                            height: 150,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomTextWidget(
                            "Lachung & Lachen 1 Night 2 Days",
                            style: CustomTextStyle.smallBoldTextStyle1(
                              color: Colors.grey.shade800,
                            ),
                            alignText: false,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "Starting from",
                            style: TextStyle(color: Colors.grey, fontSize: 11),
                          ),
                          Row(
                            children: [
                              Text(
                                "₹ 5000/-",
                                style: CustomTextStyle.smallBoldTextStyle1(
                                    color: Colors.green),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "₹ 7000/-",
                                style: CustomTextStyle.smallTextStyle1(
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                          Text(
                            "Per Person",
                            style: TextStyle(color: Colors.grey, fontSize: 11),
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
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 11),
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
                                    "Flight",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 11),
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
                                    "Meals",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 11),
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
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 11),
                                  )
                                ],
                              ),
                            ],
                          ),
                          MaterialButton(
                            height: 30.0,
                            minWidth: 270.0,
                            color: Colors.deepOrangeAccent,
                            textColor: Colors.white,
                            child: new Text("View Details"),
                            onPressed: () => {},
                            splashColor: Colors.redAccent,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.screenHorizontalPadding,
                  vertical: AppConstants.screenVerticalPadding),
              child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        "What we provide for your memorable journey",
                        style: CustomTextStyle.smallBoldTextStyle1(
                            color: Colors.black54),
                        alignText: false,
                        textOverflow: null,

                        ),
                      SizedBox(height: 5,),
                      CustomTextWidget(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                        style: CustomTextStyle.smallTextStyle1(
                            color: Colors.grey),
                        alignText: false,
                        textOverflow: null,

                      ),
                    ],
                  ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 250,
                      child: Stack(

                        clipBehavior: Clip.none,
                        children: [
                          Image.asset(
                            "assets/images/car.jpg",
                            fit: BoxFit.cover,
                            width: 300,
                            height: 200,
                          ),
                          new Positioned(
                            bottom: 10,
                            left: 15,
                            child: Container(
                                width: 270,
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    CustomTextWidget(
                                      "Sharing / Full Booking Cab",
                                      alignText: true,
                                      textOverflow: null,
                                      style: CustomTextStyle.smallBoldTextStyle1(
                                          color: Colors.deepOrangeAccent),
                                    ),
                                    CustomTextWidget(
                                      "Providing Sharing and Full Booking for your wonderful travel journey",
                                      alignText: true,
                                      textOverflow: null,
                                      style: CustomTextStyle.smallTextStyle1(
                                          color: Colors.black),
                                    ),
                                  ],
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 250,
                      child: Stack(

                        clipBehavior: Clip.none,
                        children: [
                          Image.asset(
                            "assets/images/hotel.jpg",
                            fit: BoxFit.cover,
                            width: 300,
                            height: 200,
                          ),
                          new Positioned(
                            bottom: 10,
                            left: 15,
                            child: Container(
                                width: 270,
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    CustomTextWidget(
                                      "Best Hotel for you",
                                      alignText: true,
                                      textOverflow: null,
                                      style: CustomTextStyle.smallBoldTextStyle1(
                                          color: Colors.deepOrangeAccent),
                                    ),
                                    CustomTextWidget(
                                      "We assure you the best hotel on reasonable rate",
                                      alignText: true,
                                      textOverflow: null,
                                      style: CustomTextStyle.smallTextStyle1(
                                          color: Colors.black),
                                    ),
                                  ],
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,)
          ],
        ),
      ),
      ),
    );
  }
}
