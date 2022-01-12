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
}