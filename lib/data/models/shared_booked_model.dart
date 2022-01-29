import 'dart:convert';

SharedBookedModel sharedBookedModelFromJson(String str) => SharedBookedModel.fromJson(json.decode(str));

String sharedBookedModelToJson(SharedBookedModel data) => json.encode(data.toJson());

class SharedBookedModel {
  SharedBookedModel({
    required this.message,
    required this.status,
    required this.sharedBookingId,
  });

  String message;
  bool status;
  String sharedBookingId;

  factory SharedBookedModel.fromJson(Map<String, dynamic> json) => SharedBookedModel(
    message: json["message"] == null ? null : json["message"],
    status: json["status"] == null ? null : json["status"],
    sharedBookingId: json["shared_booking_id"] == null ? null : json["shared_booking_id"],
  );

  Map<String, dynamic> toJson() => {
    "message": message == null ? null : message,
    "status": status == null ? null : status,
    "shared_booking_id": sharedBookingId == null ? null : sharedBookingId,
  };
}
