// To parse this JSON data, do
//
//     final packageTourListModel = packageTourListModelFromJson(jsonString);

import 'dart:convert';

List<PackageTourListModel> packageTourListModelFromJson(String str) => List<PackageTourListModel>.from(json.decode(str).map((x) => PackageTourListModel.fromJson(x)));

String packageTourListModelToJson(List<PackageTourListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PackageTourListModel {
  PackageTourListModel({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.discountPrice,
    required this.upto3Start,
    required this.flight,
    required this.meal,
    required this.privateCab,
    required this.pointsCovered,
  });

  String id;
  String title;
  String image;
  String price;
  String discountPrice;
  String upto3Start;
  String flight;
  String meal;
  String privateCab;
  String pointsCovered;

  factory PackageTourListModel.fromJson(Map<String, dynamic> json) => PackageTourListModel(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    image: json["image"] == null ? null : json["image"],
    price: json["price"] == null ? null : json["price"],
    discountPrice: json["discount_price"] == null ? null : json["discount_price"],
    upto3Start: json["upto_3_start"] == null ? null : json["upto_3_start"],
    flight: json["flight"] == null ? null : json["flight"],
    meal: json["meal"] == null ? null : json["meal"],
    privateCab: json["private_cab"] == null ? null : json["private_cab"],
    pointsCovered: json["points_covered"] == null ? null : json["points_covered"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "image": image == null ? null : image,
    "price": price == null ? null : price,
    "discount_price": discountPrice == null ? null : discountPrice,
    "upto_3_start": upto3Start == null ? null : upto3Start,
    "flight": flight == null ? null : flight,
    "meal": meal == null ? null : meal,
    "private_cab": privateCab == null ? null : privateCab,
    "points_covered": pointsCovered == null ? null : pointsCovered,
  };
}
