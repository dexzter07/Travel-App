import 'package:cab_booking/presentation/constants/app_constants.dart';
import 'package:cab_booking/presentation/screens/home_screen.dart';
import 'package:cab_booking/presentation/styles/app_colors.dart';
import 'package:cab_booking/presentation/styles/custom_text_style.dart';
import 'package:cab_booking/presentation/widgets/custom_text_widget.dart';
import 'package:cab_booking/presentation/widgets/full_width_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color:AppColors.backgroundColor,
                    borderRadius: BorderRadius.circular(10)
                ),
                padding:  EdgeInsets.symmetric(horizontal: AppConstants.screenHorizontalPadding,vertical: AppConstants.screenVerticalPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color:AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(
                              Icons.check,
                              size: 72,
                              color: Colors.white
                          ),
                        ),
                      ),

                    ),
                    SizedBox(height: 20,),
                    Text("Thank you!",style: CustomTextStyle.ultraBoldTextStyle1(color: AppColors.primaryColor, letterSpacing: 3),),
                    SizedBox(height: 10,),
                    CustomTextWidget("Package Booked Successfully",style: CustomTextStyle.boldMediumTextStyle(color: Colors.grey), textOverflow: null, alignText: false,) ,
                    SizedBox(height: 40,),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: FullWidthButton(
                        title: "Done",
                        borderRadius: BorderRadius.circular(15),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder:(context){return HomeScreen();}));
                        }, color: AppColors.primaryColor,
                      ),
                    )


                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
