import 'package:cab_booking/logic/controllers/day_tour_list_controller.dart';
import 'package:cab_booking/presentation/widgets/package_tour_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PackageComponent extends StatelessWidget {
  final DayTourListController _dayTourListController = Get.put(DayTourListController());
   PackageComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Obx(() => _dayTourListController.isLoading.value == true ? Center(
          child: CircularProgressIndicator(),
        ):
        ListView.builder(
          scrollDirection: Axis.horizontal,
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context,index){
              return PackageTourComponents(packageTourModel: _dayTourListController.packageTourList[index],);
            }
        ),)
    );

  }
}
