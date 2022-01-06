import 'package:cab_booking/data/data_providers/notification_api.dart';
import 'package:cab_booking/presentation/pages/home_page.dart';
import 'package:cab_booking/presentation/pages/notification_view.dart';
import 'package:cab_booking/presentation/screens/navscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NotificationApi.init(initScheduled: true);
    listenNotifications();
  }
  void listenNotifications() => NotificationApi.onNotifications.stream.listen(onClickedNotification);

  void onClickedNotification(String? payload) => Get.to(NotificationView(payload:payload));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavScreen(),
    );
  }



}
