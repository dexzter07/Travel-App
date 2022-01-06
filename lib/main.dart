import 'package:cab_booking/presentation/pages/success.dart';
import 'package:cab_booking/presentation/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(
      GetMaterialApp(
        defaultTransition: Transition.rightToLeftWithFade,
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      )
  );
}