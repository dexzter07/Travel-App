import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PermitFormController extends GetxController{
  List datas = [].obs;
  //user_id will be from Shared Preference
  var userId = "1".obs;
  //Shared Booking Id will be from Shared Preference
  var sharedBookingId = "21".obs;
  var tempAddress = TextEditingController();
  var permAddress = TextEditingController();
  var fullName = TextEditingController();
  var age = TextEditingController();
  var gender = TextEditingController();
  var passPhotoImage = "".obs;
  var idCardImage = "".obs;
  var backSideImage = "".obs;
  var paymentDone = false.obs;
  var transactionId = "".obs;
  var isLoading = false.obs;


  uploadPermitForm()async{
    isLoading.value = true;
    const String apiUrl = "http://cabbooking.rumtektechnologies.com/api/shared_bookings/touristmaster_shared_permit.php";
    final response = await http.post(Uri.parse(apiUrl),
    body:{
      'datas':datas,
    });
    isLoading.value = false;
    print(response.body);
    if(response.statusCode == 200){
      // Todo
    }
  }
}