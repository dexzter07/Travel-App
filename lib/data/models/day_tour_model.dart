// To parse this JSON data, do
//
//     final dayTourListModel = dayTourListModelFromJson(jsonString);

import 'dart:convert';

List<DayTourListModel> dayTourListModelFromJson(String str) => List<DayTourListModel>.from(json.decode(str).map((x) => DayTourListModel.fromJson(x)));

String dayTourListModelToJson(List<DayTourListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DayTourListModel {
  DayTourListModel({
    required this.id,
    required this.title,
    required this.image,
    required this.image2,
    required this.image3,
    required this.price,
    required this.discountPrice,
    required this.pointCovered,
  });

  String id;
  String title;
  String image;
  String image2;
  String image3;
  String price;
  String discountPrice;
  String pointCovered;

  factory DayTourListModel.fromJson(Map<String, dynamic> json) => DayTourListModel(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    image: json["image"] == null ? null : json["image"],
    image2: json["image2"] == null ? null : json["image2"],
    image3: json["image3"] == null ? null : json["image3"],
    price: json["price"] == null ? null : json["price"],
    discountPrice: json["discount_price"] == null ? null : json["discount_price"],
    pointCovered: json["point_covered"] == null ? null : json["point_covered"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "image": image == null ? null : image,
    "image2": image2 == null ? null : image2,
    "image3": image3 == null ? null : image3,
    "price": price == null ? null : price,
    "discount_price": discountPrice == null ? null : discountPrice,
    "point_covered": pointCovered == null ? null : pointCovered,
  };
}
