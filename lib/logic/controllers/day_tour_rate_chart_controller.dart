import 'package:cab_booking/data/data_providers/day_tour_rate_chart_services.dart';
import 'package:cab_booking/data/models/day_tour_model.dart';
import 'package:cab_booking/data/models/day_tour_rate_chart_model.dart';
import 'package:cab_booking/data/models/package_tour_model.dart';
import 'package:get/get.dart';

class DayTourRateController extends GetxController{
  var dayTourRateChartList = <DayTourRateChartModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchDayTourRateChart();
    super.onInit();
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