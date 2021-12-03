import 'package:cab_booking/presentation/pages/home_page.dart';
import 'package:cab_booking/presentation/pages/my_trips.dart';
import 'package:cab_booking/presentation/pages/notification_view.dart';
import 'package:cab_booking/presentation/pages/profile_page.dart';
import 'package:cab_booking/presentation/styles/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavScreen(tabIndex: 0, index: 0,),
    );
  }
}

class BottomNavScreen extends StatefulWidget {

  final int index;
  final int tabIndex;
  BottomNavScreen({required this.index,required this.tabIndex});


  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {

  int _currentIndex = 0;
  int _tabIndex = 0;
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    setState(() {
      _currentIndex = widget.index;
      _tabIndex = widget.tabIndex;
    });
    _controller = PersistentTabController(initialIndex: _currentIndex);
  }


  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
        context,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: false, // Recommended to set 'resizeToAvoidBottomInset' as tre while using this argument. Default is true.
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        navBarStyle: NavBarStyle.simple, // Cho
    );
  }
  List<Widget> _buildScreens() {
    return [
      HomePage(),
      MyTrip(),
      NotificationView(),
      ProfilePage()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        activeColorPrimary: Colors.black54,
          activeColorSecondary: AppColors.primaryColor,
          icon: Icon(Icons.home),title:"Home",textStyle: TextStyle(fontFamily: "PoppinsRegular",fontSize: 11)
      ),
      PersistentBottomNavBarItem(
          activeColorSecondary: AppColors.primaryColor,
          activeColorPrimary: Colors.black54,
          icon: Icon(Icons.card_travel,),title:"Trips",textStyle: TextStyle(fontFamily: "PoppinsRegular",fontSize: 11)
      ),
      PersistentBottomNavBarItem(
          activeColorPrimary: Colors.black54,
          activeColorSecondary: AppColors.primaryColor,
          icon: Icon(Icons.notifications),title:"Notification",textStyle: TextStyle(fontFamily: "PoppinsRegular",fontSize: 11)
      ),

      PersistentBottomNavBarItem(
          activeColorSecondary: AppColors.primaryColor,
          activeColorPrimary: Colors.black54,
          icon: Icon(Icons.menu),title:"Menu",textStyle: TextStyle(fontFamily: "PoppinsRegular",fontSize: 11)
      ),
    ];
  }
}

