// To parse this JSON data, do
//
//     final sharedBookingModel = sharedBookingModelFromJson(jsonString);

import 'dart:convert';

SharedBookingModel sharedBookingModelFromJson(String str) => SharedBookingModel.fromJson(json.decode(str));

String sharedBookingModelToJson(SharedBookingModel data) => json.encode(data.toJson());

class SharedBookingModel {
  SharedBookingModel({
    required this.message,
    required this.status,
    required this.dayTourId,
    required this.noOfPerson,
    required this.vehicleType,
    required this.price,
    required this.bookingDate,
    required this.seat,
  });

  String message;
  bool status;
  String dayTourId;
  String noOfPerson;
  String vehicleType;
  String price;
  String bookingDate;
  String seat;

  factory SharedBookingModel.fromJson(Map<String, dynamic> json) => SharedBookingModel(
    message: json["Message"] == null ? null : json["Message"],
    status: json["Status"] == null ? null : json["Status"],
    dayTourId: json["Day_tour_id"] == null ? null : json["Day_tour_id"],
    noOfPerson: json["No_of_Person"] == null ? null : json["No_of_Person"],
    vehicleType: json["Vehicle_type"] == null ? null : json["Vehicle_type"],
    price: json["Price"] == null ? null : json["Price"],
    bookingDate: json["Booking_Date"],
    seat: json["seat"] == null ? null : json["seat"],
  );

  Map<String, dynamic> toJson() => {
    "Message": message == null ? null : message,
    "Status": status == null ? null : status,
    "Day_tour_id": dayTourId == null ? null : dayTourId,
    "No_of_Person": noOfPerson == null ? null : noOfPerson,
    "Vehicle_type": vehicleType == null ? null : vehicleType,
    "Price": price == null ? null : price,
    "Booking_Date": bookingDate,
    "seat": seat == null ? null : seat,
  };
}
