// To parse this JSON data, do
//
//     final availDayTourSharedCabModel = availDayTourSharedCabModelFromJson(jsonString);

import 'dart:convert';

List<AvailDayTourSharedCabModel> availDayTourSharedCabModelFromJson(String str) => List<AvailDayTourSharedCabModel>.from(json.decode(str).map((x) => AvailDayTourSharedCabModel.fromJson(x)));

String availDayTourSharedCabModelToJson(List<AvailDayTourSharedCabModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AvailDayTourSharedCabModel {
  AvailDayTourSharedCabModel({
    required this.id,
    required this.price,
    required this.vehicleModel,
    required this.totalSeat,
    required this.title,
    required this.timing,
  });

  String id;
  String price;
  String vehicleModel;
  String totalSeat;
  String title;
  String timing;

  factory AvailDayTourSharedCabModel.fromJson(Map<String, dynamic> json) => AvailDayTourSharedCabModel(
    id: json["id"] == null ? null : json["id"],
    price: json["price"] == null ? null : json["price"],
    vehicleModel: json["vehicle_model"] == null ? null : json["vehicle_model"],
    totalSeat: json["total_seat"] == null ? null : json["total_seat"],
    title: json["title"] == null ? null : json["title"],
    timing: json["timing"] == null ? null : json["timing"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "price": price == null ? null : price,
    "vehicle_model": vehicleModel == null ? null : vehicleModel,
    "total_seat": totalSeat == null ? null : totalSeat,
    "title": title == null ? null : title,
    "timing": timing == null ? null : timing,
  };
}
