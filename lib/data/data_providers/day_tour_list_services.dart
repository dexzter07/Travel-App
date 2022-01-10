import 'package:cab_booking/data/models/day_tour_model.dart';
import 'package:http/http.dart' as http;


class DayTourListApi {
  static var client = http.Client();

  static Future<List<DayTourListModel>?> fetchEvents() async {
    var response = await client.get(
      Uri.parse("http://cabbooking.rumtektechnologies.com/api/day_tour_master/day_tour.php"),
      headers: {"Keep-Alive":"1000"}
    );
    if (response.statusCode == 200){
      var jsonResponse = dayTourListModelFromJson(response.body);
      return jsonResponse;
    }
    else{
      return null;
    }
  }
}