import 'package:cab_booking/data/models/shared_booked_model.dart';
import 'package:cab_booking/data/models/shared_booking_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SharedBookingController extends GetxController{
  var numOfPerson = '1'.obs;
  var travelDate = ''.obs;
  var vehicleType = 'Small'.obs;
  var price = ''.obs;
  var seatAvail = ''.obs;
  var isLoading = false.obs;

  addDataAndFetch() async {
    isLoading.value = true;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var id = sharedPreferences.getString("id");
    final String apiUrl = "http://cabbooking.rumtektechnologies.com/api/shared_bookings/shared_booking.php";
    final response = await http.post(Uri.parse(apiUrl),
        body: {
            'id':id,
            'person':numOfPerson.value,
            'date':travelDate.value,
            'vehicle':vehicleType.value,
        }
    );
    isLoading.value = false;
    print(response.body);
    if(response.statusCode == 200){
      var jsonResponse = sharedBookingModelFromJson(response.body);
      price.value = jsonResponse.price;
      seatAvail.value = jsonResponse.seat;
    }
    else{
      print("No Response");
    }
  }

  confirmBooking()async{
    isLoading.value = true;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var vehicleId = sharedPreferences.getString("vehicle_id");
    final String apiUrl = "http://cabbooking.rumtektechnologies.com/api/shared_bookings/shared_booked_add.php?vehicle_id=$vehicleId";
    final response = await http.post(Uri.parse(apiUrl),
        body: {
          'user_id':"ada",
          'total_person':numOfPerson.value,
          'travel_date':travelDate.value,
          'total_price':price.value,
          'destination':"demo",
        }
    );
    isLoading.value = false;
    print(response.body);
    if(response.statusCode == 200){
      var jsonResponse = sharedBookedModelFromJson(response.body);
      String sharedId = jsonResponse.sharedBookingId.toString();
      print(sharedId);
    }
    else{
      print("No Response");
    }
  }
}