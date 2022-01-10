import 'package:cab_booking/data/models/day_tour_rate_chart_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DayTourRateChartApi {
  static var client = http.Client();

  static Future<List<DayTourRateChartModel>?> fetchEvents() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var id = sharedPreferences.getString("id");
    var response = await client.get(
        Uri.parse("http://cabbooking.rumtektechnologies.com/api/rate_chart/day_tour_rate_chart.php?id=$id"),
        headers: {"Keep-Alive":"1000"}
    );
    if (response.statusCode == 200){
      var jsonResponse = dayTourRateChartModelFromJson(response.body);
      return jsonResponse;
    }
    else{
      return null;
    }
  }
}