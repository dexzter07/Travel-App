// To parse this JSON data, do
//
//     final seatAvailModel = seatAvailModelFromJson(jsonString);

import 'dart:convert';

SeatAvailModel seatAvailModelFromJson(String str) => SeatAvailModel.fromJson(json.decode(str));

String seatAvailModelToJson(SeatAvailModel data) => json.encode(data.toJson());

class SeatAvailModel {
  SeatAvailModel({
    required this.message,
    required this.status,
    required this.availableSeat,
    required this.seatBooked,
    required this.seatLeft,
  });

  String message;
  bool status;
  String availableSeat;
  List<String> seatBooked;
  int seatLeft;

  factory SeatAvailModel.fromJson(Map<String, dynamic> json) => SeatAvailModel(
    message: json["message"] == null ? null : json["message"],
    status: json["status"] == null ? null : json["status"],
    availableSeat: json["available_seat"] == null ? null : json["available_seat"],
    seatBooked: List<String>.from(json["seat_booked"].map((x) => x)),
    seatLeft: json["seat_left"] == null ? null : json["seat_left"],
  );

  Map<String, dynamic> toJson() => {
    "message": message == null ? null : message,
    "status": status == null ? null : status,
    "available_seat": availableSeat == null ? null : availableSeat,
    "seat_booked": seatBooked == null ? null : List<dynamic>.from(seatBooked.map((x) => x)),
    "seat_left": seatLeft == null ? null : seatLeft,
  };
}
