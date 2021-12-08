import 'package:cab_booking/presentation/constants/app_constants.dart';
import 'package:cab_booking/presentation/pages/authentication/login.dart';
import 'package:cab_booking/presentation/pages/privacy_policy.dart';
import 'package:cab_booking/presentation/styles/app_colors.dart';
import 'package:cab_booking/presentation/styles/custom_text_style.dart';
import 'package:cab_booking/presentation/widgets/custom_inkwell.dart';
import 'package:cab_booking/presentation/widgets/custom_text_widget.dart';
import 'package:cab_booking/presentation/widgets/user_profile_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:launch_review/launch_review.dart';
import 'package:share/share.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height:50,),
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/landing.jpg"),
                  radius: 60,
                ),
                SizedBox(height: 10,),
                CustomTextWidget("dexztercodes07@gmail.com",style: CustomTextStyle.boldMediumTextStyle(color: Colors.black), alignText: false, textOverflow: null,),
                CustomTextWidget("+91 8637390902",style: CustomTextStyle.smallTextStyle1(color: Colors.black), textOverflow: null, alignText: false),
                SizedBox(height: 50,),

                InkWell(
                    onTap: (){
                          Container(
                            color: AppColors.primaryColor,
                            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.call,color: Colors.white,size: 20,),
                                    SizedBox(width: 10,),
                                    CustomTextWidget("9805440315",style: CustomTextStyle.mediumTextStyle(color: Colors.white), alignText: false, textOverflow: null,)
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Icon(Icons.email,color: Colors.white,size: 20,),
                                    SizedBox(width: 10,),
                                    CustomTextWidget("support@email.com",style: CustomTextStyle.mediumTextStyle(color: Colors.white), textOverflow: null, alignText: false,)
                                  ],
                                ),
                              ],
                            ),

                      );
                    },
                    child: UserProfileComponent(Title: "Contact Us",icon: Icon(Icons.phone,color: AppColors.primaryColor,size: 17,),)),
                InkWell(
                    onTap: (){
                      Share.share(SHAREMESSAGE);
                    },
                    child: UserProfileComponent(Title: "Invite Friends",icon: Icon(Icons.share,color: AppColors.primaryColor,size: 17,),)),
                InkWell(
                    onTap: (){
                      LaunchReview.launch(androidAppId: "com.gtkbasket");
                    },
                    child: UserProfileComponent(Title: "Rate Us",icon: Icon(Icons.star,color: AppColors.primaryColor,size: 17,),)),
                InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){return PrivacyPolicy();}));
                    },
                    child: UserProfileComponent(Title: "Privacy Policy",icon: Icon(Icons.policy,color: AppColors.primaryColor,size: 17,),)),
                InkWell(
                   onTap: (){
                     // Navigator.push(context, MaterialPageRoute(builder: (context){return HelpSupport();}));
                  },
                    child: UserProfileComponent(Title: "Help and Support",icon: Icon(Icons.help,color: AppColors.primaryColor,size: 17,),)),
                InkWell(
                    onTap: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Login()), (route) => false);

                    },
                    child: UserProfileComponent(Title: "Logout",icon: Icon(Icons.logout,color: AppColors.primaryColor,size: 17,),)),

              ],
            ),
          ),
        )
    );
  }
}
