// To parse this JSON data, do
//
//     final dayTourRateChartModel = dayTourRateChartModelFromJson(jsonString);

import 'dart:convert';

List<DayTourRateChartModel> dayTourRateChartModelFromJson(String str) => List<DayTourRateChartModel>.from(json.decode(str).map((x) => DayTourRateChartModel.fromJson(x)));

String dayTourRateChartModelToJson(List<DayTourRateChartModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DayTourRateChartModel {
  DayTourRateChartModel({
    required this.id,
    required this.dayTourId,
    required this.vehicleType,
    required this.shared,
    required this.reserved,
  });

  String id;
  String dayTourId;
  String vehicleType;
  String shared;
  String reserved;

  factory DayTourRateChartModel.fromJson(Map<String, dynamic> json) => DayTourRateChartModel(
    id: json["id"] == null ? null : json["id"],
    dayTourId: json["day_tour_id"] == null ? null : json["day_tour_id"],
    vehicleType: json["vehicle_type"] == null ? null : json["vehicle_type"],
    shared: json["shared"] == null ? null : json["shared"],
    reserved: json["reserved"] == null ? null : json["reserved"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "day_tour_id": dayTourId == null ? null : dayTourId,
    "vehicle_type": vehicleType == null ? null : vehicleType,
    "shared": shared == null ? null : shared,
    "reserved": reserved == null ? null : reserved,
  };
}
