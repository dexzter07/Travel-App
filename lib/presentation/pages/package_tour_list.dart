import 'package:cab_booking/logic/controllers/day_tour_list_controller.dart';
import 'package:cab_booking/presentation/styles/app_colors.dart';
import 'package:cab_booking/presentation/widgets/package_tour_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PackageTourList extends StatelessWidget {
  final DayTourListController _dayTourListController = Get.put(DayTourListController());
  PackageTourList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Package Tour List"),
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
      ),
      body: Obx(() => _dayTourListController.isLoading.value == true ? Center(
        child: CircularProgressIndicator(),
      ):
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: _dayTourListController.packageTourList.length,
            itemBuilder: (context,index){
              return PackageTourComponents(packageTourModel: _dayTourListController.packageTourList[index],);
            }
        ),
      ),)
    );
  }
}
