import 'dart:io';
import 'package:cab_booking/data/models/seat_avail_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SeatAvailServices {
  static var client = http.Client();

  static Future<SeatAvailModel?> fetchEvents() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var vehicleId = sharedPreferences.getString("vehicle_id");

    var response = await client.get(
        Uri.parse("http://cabbooking.rumtektechnologies.com/api/shared_bookings/seat_booking.php?vehicle_id=$vehicleId"),
    );
    if (response.statusCode == 200){
      var jsonResponse = seatAvailModelFromJson(response.body);
      print(vehicleId);
      return jsonResponse;
    }
    else{
      return null;
    }
  }
}