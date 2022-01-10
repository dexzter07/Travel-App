import 'package:cab_booking/data/data_providers/day_tour_list_services.dart';
import 'package:cab_booking/data/data_providers/day_tour_rate_chart_services.dart';
import 'package:cab_booking/data/data_providers/package_tour_list_services.dart';
import 'package:cab_booking/data/models/day_tour_model.dart';
import 'package:cab_booking/data/models/day_tour_rate_chart_model.dart';
import 'package:cab_booking/data/models/package_tour_model.dart';
import 'package:get/get.dart';

class DayTourListController extends GetxController{
  var dayTourList = <DayTourListModel>[].obs;
  var packageTourList = <PackageTourListModel>[].obs;
  var dayTourRateChartList = <DayTourRateChartModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchEvents();
    fetchPackage();
    fetchDayTourRateChart();
    super.onInit();
  }

  void fetchEvents() async{
    isLoading.value = true;
    var data = await DayTourListApi.fetchEvents();
    if(data != null){
      isLoading.value = false;
      dayTourList.assignAll(data);
    }
  }

  void fetchPackage() async{
    isLoading.value = true;
    var data = await PackageTourListApi.fetchEvents();
    if(data != null){
      isLoading.value = false;
      packageTourList.assignAll(data);
    }
  }

  void fetchDayTourRateChart() async{
    isLoading.value = true;
    var data = await DayTourRateChartApi.fetchEvents();
    if(data != null){
      isLoading.value = false;
      dayTourRateChartList.assignAll(data);
    }
  }
}