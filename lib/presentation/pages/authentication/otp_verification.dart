import 'dart:async';

import 'package:cab_booking/presentation/screens/home_screen.dart';
import 'package:cab_booking/presentation/screens/navscreen.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';


class VerifyOTP extends StatefulWidget {
  final String? prefix;
  final String? phone;
  VerifyOTP({this.phone, this.prefix});
  @override
  _VerifyOTPState createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  int start = 30;
  bool wait = true;
  String buttonName = "" ;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late String _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: const Color.fromRGBO(247 ,121,125, 1),
    ),
  );
  void startTimer(){
    const onSec = Duration(seconds: 1);
    Timer timer = Timer.periodic(onSec, (timer){
      if(start == 0){
        if(mounted) {
          setState(() {
            timer.cancel();
            wait = false;
          });
        }
      }
      else {
        if(mounted) {
          setState(() {
            start --;
          });
        }
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Verify OTP'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  colors: [
                    Color.fromRGBO(251 ,215,134, 1),
                    Color.fromRGBO(247 ,121,125, 1),
                  ]
              )
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/login_bottom.jpg"),
                radius: 100,
              ),
            ),


            SizedBox(height: 10,),

            Container(
              margin: EdgeInsets.only(top: 40),
              child: Center(
                child: Container(

                  child: Column(
                    children: [
                      Text("Enter OTP"),
                      SizedBox(height: 7,),
                      Text(
                        '+91-${widget.phone}',
                        style: TextStyle(fontSize: 26),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: PinPut(
                fieldsCount: 6,
                textStyle: const TextStyle(fontSize: 25.0, color: Colors.black),
                eachFieldWidth: 40.0,
                eachFieldHeight: 55.0,
                focusNode: _pinPutFocusNode,
                controller: _pinPutController,
                submittedFieldDecoration: pinPutDecoration,
                selectedFieldDecoration: pinPutDecoration,
                followingFieldDecoration: pinPutDecoration,
                pinAnimationType: PinAnimationType.fade,
                onSubmit: (pin) async {
                  try {
                    await FirebaseAuth.instance
                        .signInWithCredential(PhoneAuthProvider.credential(
                        verificationId: _verificationCode, smsCode: pin))
                        .then((value) async {
                      if (value.user != null) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => NavScreen()),
                                (route) => false);
                      }
                    });
                  } catch (e) {
                    FocusScope.of(context).unfocus();
                    _scaffoldKey.currentState!
                        .showSnackBar(SnackBar(content: Text('invalid OTP')));
                  }
                },
              ),
            ),
            RichText(text: TextSpan(
              children: [
                TextSpan(text: "Send OTP again in  ", style: TextStyle(fontSize: 16, color: Colors.black)),
                TextSpan(text: "00:$start", style: TextStyle(fontSize: 16, color: Colors.deepOrangeAccent)),
                TextSpan(text: "  sec ", style: TextStyle(fontSize: 16, color: Colors.black)),

              ]
            )),
            Container(child: wait?null:
            MaterialButton(onPressed: wait? null: (){

              startTimer();
              if(mounted) {
                setState(() {
                  start = 30;
                  wait = true;
                  _verifyPhone();
                });
              }
            },
              color: Colors.transparent,
            child: Text("Resend"),
            ))
          ],
        ),
      ),
    );
  }
  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Get.to(HomeScreen());
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String? verificationID, int? resendToken) {
          if(mounted) {
            setState(() {
              _verificationCode = verificationID!;
            });
          }
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          if(mounted) {
            setState(() {
              _verificationCode = verificationID;
            });
          }
        },
        timeout: Duration(seconds: 20));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();

    _verifyPhone();

  }
}