import 'dart:io';

import 'package:cab_booking/data/models/avail_day_tour_shared_cab_model.dart';
import 'package:cab_booking/logic/controllers/shared_booking_controller.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';


class AvailCabListApi {
  static var client = http.Client();

  static Future<List<AvailDayTourSharedCabModel>?> fetchEvents() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    late SharedBookingController _shared = Get.put(SharedBookingController());

    var id = sharedPreferences.getString("id");
    var response = await client.get(
        Uri.parse("http://cabbooking.rumtektechnologies.com/api/shared_bookings/vehicle_list.php?id=$id&person=${_shared.numOfPerson}&vehicle=${_shared.vehicleType}&price=${_shared.price}"),
        headers: {"Keep-Alive":"1000",

        }
    );
    if (response.statusCode == 200){
      var jsonResponse = availDayTourSharedCabModelFromJson(response.body);
      return jsonResponse;
    }
    else{
      return null;
    }
  }
}