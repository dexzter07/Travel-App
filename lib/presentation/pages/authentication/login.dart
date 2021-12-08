import 'package:cab_booking/presentation/constants/app_constants.dart';
import 'package:cab_booking/presentation/styles/custom_text_style.dart';
import 'package:cab_booking/presentation/widgets/custom_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'otp_verification.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String? number;
  String _prefix = '+91 ';
  // final String url1 = "http://192.168.2.18:8000/api/validate_phone/";
  // String dataa;
  // Future<String> getData(String num) async {
  //   var res = await http
  //       .post(Uri.encodeFull(url1), body
  //       : {"phone":number});
  //   var resbody = json.decode(res.body);
  //   print(resbody);
  //
  //   return "Sucess";
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(

        padding: EdgeInsets.symmetric(horizontal: AppConstants.screenHorizontalPadding,vertical: AppConstants.screenVerticalPadding),
        color: Colors.white,
        child: ListView(

          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.1,),
            Text("Sign up", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900)),
            SizedBox(height: 14,),
            CustomTextWidget("Please Provide your Phone Number", style: CustomTextStyle.boldMediumTextStyle(color: Colors.grey), alignText: false, textOverflow: null),
            CustomTextWidget("to Continue", style: CustomTextStyle.boldMediumTextStyle(color: Colors.grey), alignText: false, textOverflow: null),
            SizedBox(height: 14,),
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/login_bottom.jpg"),
                radius: 100,
              ),
            ),


            SizedBox(height: 10,),
            Form(
              key: _formKey,
              child: Material(
                elevation: 5,
                shadowColor: Colors.grey,
                borderRadius: BorderRadius.circular(33),
                child: TextFormField(
                  validator: (value){
                    if (value!.isEmpty){
                      return 'Please enter the number';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  onChanged: (val) {
                    number = val;
                  },
                  style: TextStyle(
                    height: 1,

                  ),


                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(

                        borderRadius: BorderRadius.all(Radius.circular(33.0)),
                        borderSide: BorderSide(color: Colors.white)

                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(33.0)),
                        borderSide: BorderSide(color: Colors.white)

                    ),

                    prefixIcon: Icon(Icons.phone, color: Colors.black),

                    prefixText: _prefix,
                    hintText: "Enter your number",

                    hintStyle: TextStyle(
                      color: Colors.black54,
                      fontFamily:'Poppins',

                    ),





                  ),


                ),
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Send OTP  ", style: TextStyle(fontSize: 15, fontFamily: 'ShipporiMinchoB1', fontWeight: FontWeight.bold),),
                    Container(

                        child: Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Icon(Icons.arrow_forward_ios_rounded,color:Colors.white,),
                        ),
                        decoration: BoxDecoration(
                            color:  Colors.deepOrangeAccent,
                            borderRadius: BorderRadius.circular(50)

                        )

                    )

                  ],
                ),
                onTap: ()async{


                  // final String num=number;
                  // final String user =await getData(num);
                  //
                  // setState(() {
                  //   dataa=user;
                  // });

                  if(_formKey.currentState!.validate()){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => VerifyOTP(phone:number)));
                  }
                }
            ),



          ],
        ),
      ),
    );
  }
}
