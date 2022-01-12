import 'package:cab_booking/data/data_providers/avail_day_tour_shared_cab_services.dart';
import 'package:cab_booking/data/models/avail_day_tour_shared_cab_model.dart';
import 'package:get/get.dart';

class AvailDayTourCabSharedController extends GetxController{
  var availSharedCab = <AvailDayTourSharedCabModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchEvents();
    super.onInit();
  }

  void fetchEvents() async{
    isLoading.value = true;
    var data = await AvailCabListApi.fetchEvents();
    if(data != null){
      isLoading.value = false;
      availSharedCab.assignAll(data);
    }
    else{
      print("no data found");
    }
  }

}