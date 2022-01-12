import 'package:cab_booking/data/models/avail_day_tour_shared_cab_model.dart';
import 'package:http/http.dart' as http;


class AvailCabListApi {
  static var client = http.Client();

  static Future<List<AvailDayTourSharedCabModel>?> fetchEvents() async {
    var response = await client.get(
        Uri.parse("http://cabbooking.rumtektechnologies.com/api/shared_bookings/vehicle_list.php"),
        headers: {"Keep-Alive":"1000",
                "Cookie":"PHPSESSID=51291c8d9257b864c2adbf04bba6c9c8",
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