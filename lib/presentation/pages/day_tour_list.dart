import 'package:cab_booking/logic/controllers/day_tour_list_controller.dart';
import 'package:cab_booking/presentation/styles/app_colors.dart';
import 'package:cab_booking/presentation/widgets/custom_silver_grid_delegate.dart';
import 'package:cab_booking/presentation/widgets/day_tour_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DayTourList extends StatelessWidget {
  final DayTourListController _dayTourListController = Get.put(DayTourListController());
   DayTourList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Day Tour List"),
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
      ),
      body: Obx(() => _dayTourListController.isLoading.value == true ? Center(
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
    );
  }
}
