import 'package:cab_booking/data/data_providers/seats_avail_services.dart';
import 'package:cab_booking/data/models/seat_avail_model.dart';
import 'package:get/get.dart';

class SeatAvailController extends GetxController{
  var datas = [].obs;
  var seats = ''.obs;
  var onPressed = false.obs;
  var booked = false.obs;
  var seats1 = ''.obs;
  var onPressed1 = false.obs;
  var booked1 = false.obs;
  var seats2 = ''.obs;
  var onPressed2 = false.obs;
  var booked2 = false.obs;
  var seats3 = ''.obs;
  var onPressed3 = false.obs;
  var booked3 = false.obs;
  var seats4 = ''.obs;
  var onPressed4 = false.obs;
  var booked4 = false.obs;
  var seats5 = ''.obs;
  var onPressed5 = false.obs;
  var booked5 = false.obs;
  var seats6 = ''.obs;
  var onPressed6 = false.obs;
  var booked6 = false.obs;
  var seats7 = ''.obs;
  var onPressed7 = false.obs;
  var booked7 = false.obs;
  var seats8 = ''.obs;
  var onPressed8 = false.obs;
  var booked8 = false.obs;
  var seats9 = ''.obs;
  var onPressed9 = false.obs;
  var booked9 = false.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchEvents();
    super.onInit();
  }

  void fetchEvents() async{
    isLoading.value = true;
    var data = await SeatAvailServices.fetchEvents();
    if(data != null){
      isLoading.value = false;
      datas.value = data.seatBooked.toList();
      for( String i in datas.value){
          String val = i;
          if(val == "1"){
            seats.value = val;
            onPressed.value = true;
            booked.value = true;
          }
          else if(val == "2"){
            seats1.value = val;
            onPressed1.value = true;
            booked1.value = true;
          }
          else if(val == "3"){
            seats2.value = val;
            onPressed2.value = true;
            booked2.value = true;
          }
          else if(val == "4"){
            seats3.value = val;
            onPressed3.value = true;
            booked3.value = true;
          }
          else if(val == "5"){
            seats4.value = val;
            onPressed4.value = true;
            booked4.value = true;
          }
          else if(val == "6"){
            seats5.value = val;
            onPressed5.value = true;
            booked5.value = true;
          }
          else if(val == "7"){
            seats6.value = val;
            onPressed6.value = true;
            booked6.value = true;
          }
          else if(val == "8"){
            seats7.value = val;
            onPressed7.value = true;
            booked7.value = true;
          }
          else if(val == "9"){
            seats8.value = val;
            onPressed8.value = true;
            booked8.value = true;
          }
          else{
            seats9.value = val;
            onPressed9.value = true;
            booked9.value = true;
          }
        }
    }
    else{
      print("no data found");
    }
  }

}