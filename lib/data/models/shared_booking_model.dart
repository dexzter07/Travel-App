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
    required this.noOfPerson,
    required this.vehicleType,
    required this.price,
    required this.bookingDate,
    required this.seat,
  });

  String message;
  bool status;
  String noOfPerson;
  String vehicleType;
  String price;
  String bookingDate;
  String seat;

  factory SharedBookingModel.fromJson(Map<String, dynamic> json) => SharedBookingModel(
    message: json["Message"] == null ? null : json["Message"],
    status: json["Status"] == null ? null : json["Status"],
    noOfPerson: json["No of Person"] == null ? null : json["No of Person"],
    vehicleType: json["Vehicle_type"] == null ? null : json["Vehicle_type"],
    price: json["Price"] == null ? null : json["Price"],
    bookingDate: json["Booking Date"] == null ? null : json["Booking Date"],
    seat: json["seat"] == null ? null : json["seat"],
  );

  Map<String, dynamic> toJson() => {
    "Message": message == null ? null : message,
    "Status": status == null ? null : status,
    "No of Person": noOfPerson == null ? null : noOfPerson,
    "Vehicle_type": vehicleType == null ? null : vehicleType,
    "Price": price == null ? null : price,
    "Booking Date": bookingDate == null ? null : bookingDate,
    "seat": seat == null ? null : seat,
  };
}
