import 'package:cab_booking/data/models/car_category_model.dart';
import 'package:cab_booking/logic/controllers/day_tour_list_controller.dart';
import 'package:cab_booking/presentation/constants/app_constants.dart';
import 'package:cab_booking/presentation/styles/custom_text_style.dart';
import 'package:cab_booking/presentation/widgets/PackageComponent.dart';
import 'package:cab_booking/presentation/widgets/custom_inkwell.dart';
import 'package:cab_booking/presentation/widgets/custom_silver_grid_delegate.dart';
import 'package:cab_booking/presentation/widgets/custom_text_widget.dart';
import 'package:cab_booking/presentation/widgets/day_tour_widget.dart';
import 'package:cab_booking/presentation/widgets/product_widget.dart';
import 'package:cab_booking/presentation/widgets/shimmer_effect_components.dart';
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
  late bool _isLoading;
  final DayTourListController _dayTourListController = Get.put(DayTourListController());
  List<ProductModel> _productList = [
    ProductModel(imageUrl: "assets/images/car_category/bolero.png",title: "Standard Vehicle",subTitle: "10 Seats",desc: "Scoprio, Bolero, etc"),
    ProductModel(imageUrl: "assets/images/car_category/mahi-xylo.png",title: "Luxury Vehicle",subTitle: "7 Seats",desc: "Xylo, Innova"),

  ];
  List<ProductModel> _productList1 = [
    ProductModel(imageUrl: "assets/images/car_category/wagonr.png",title: "Small Vehicle",subTitle: "4 Seats",desc: "Wagon-R, Swift, Kwid, etc."),
    ProductModel(imageUrl: "assets/images/car_category/fortuner.png",title: "Super Luxury Vehicle",subTitle: "",desc: "Coming Soon!"),

  ];

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

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
            throw Exception("Cannot launch the url");
          }
        },
        child: Padding(
            padding: EdgeInsets.all(2),
            child: Image.asset("assets/images/whatsapp.png")),
      ),
      body: SafeArea(
      child: _isLoading == true ?
      Center(
        child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: const Offset(3, 3))
              ]
          ),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: CircularProgressIndicator(
              color: Colors.deepOrangeAccent,
            ),
          ),
        ),
      ):
      Container(
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
                  top: 40,
                  left: 30,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppConstants.screenHorizontalPadding,
                        vertical: AppConstants.screenVerticalPadding),
                    child: Row(
                      children: [
                        Container(
                          child: Image.asset(
                            "assets/images/book_cab.png",
                            fit: BoxFit.fitWidth,
                            height: 110,
                            width: 110,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextWidget("Book Your Cab",
                                style: CustomTextStyle.boldTextStyle(
                                    color: Colors.white),
                                alignText: true,
                                textOverflow: null),
                            CustomTextWidget("Powered By Rumtek Technologies",
                                style: CustomTextStyle.ultraSmallBoldTextStyle(
                                    color: Colors.white),
                                alignText: true,
                                textOverflow: null),
                          ],
                        ),



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
              child: Obx(() => _dayTourListController.isLoading.value == true ? Center(
                child: CircularProgressIndicator(),
              ): GridView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                    crossAxisCount: 2,
                    height: 233.0,
                  ),
                  itemCount: _dayTourListController.dayTourList.length,
                  itemBuilder: (context,index){
                    return DayTourWidget(dayTourModel: _dayTourListController.dayTourList[index],);
                  }
              ),)
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
            PackageComponent(),
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



class NewsCardSkelton extends StatelessWidget {
  const NewsCardSkelton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Skeleton(height: 120, width: 120),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Skeleton(width: 80),
              const SizedBox(height: 16 / 2),
              const Skeleton(),
              const SizedBox(height: 16 / 2),
              const Skeleton(),
              const SizedBox(height: 16 / 2),
              Row(
                children: const [
                  Expanded(
                    child: Skeleton(),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Skeleton(),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}