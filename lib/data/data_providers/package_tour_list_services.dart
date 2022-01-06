import 'package:cab_booking/data/models/package_tour_model.dart';
import 'package:http/http.dart' as http;

class PackageTourListApi {
  static var client = http.Client();

  static Future<List<PackageTourListModel>?> fetchEvents() async {
    var response = await client.get(
        Uri.parse("http://cabbooking.rumtektechnologies.com/api/package_tour_master/package_tour_master.php"),
        headers: {"Keep-Alive":"1000"}
    );
    if (response.statusCode == 200){
      var jsonResponse = packageTourListModelFromJson(response.body);
      return jsonResponse;
    }
    else{
      return null;
    }
  }
}