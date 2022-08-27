// To parse this JSON data, do
//
//     final fruiteModel = fruiteModelFromJson(jsonString);

import 'dart:convert';

List<FruiteModel> fruiteModelFromJson(String str) => List<FruiteModel>.from(
    json.decode(str).map((x) => FruiteModel.fromJson(x)));

String fruiteModelToJson(List<FruiteModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FruiteModel {
  FruiteModel({
    required this.seller,
    required this.product,
    required this.variety,
    required this.price,
    required this.avgWeight,
    required this.perBox,
    required this.boxes,
    required this.delivery,
  });

  String seller;
  String product;
  String variety;
  int price;
  int avgWeight;
  int perBox;
  int boxes;
  String delivery;

  FruiteModel copyWith({
    String? seller,
    String? product,
    String? variety,
    int? price,
    int? avgWeight,
    int? perBox,
    int? boxes,
    String? delivery,
  }) =>
      FruiteModel(
        seller: seller ?? this.seller,
        product: product ?? this.product,
        variety: variety ?? this.variety,
        price: price ?? this.price,
        avgWeight: avgWeight ?? this.avgWeight,
        perBox: perBox ?? this.perBox,
        boxes: boxes ?? this.boxes,
        delivery: delivery ?? this.delivery,
      );

  factory FruiteModel.fromJson(Map<String, dynamic> json) => FruiteModel(
        seller: json["Seller"],
        product: json["Product"],
        variety: json["Variety"],
        price: json["Price"],
        avgWeight: json["AvgWeight"],
        perBox: json["PerBox"],
        boxes: json["Boxes"],
        delivery: json["Delivery"],
      );

  Map<String, dynamic> toJson() => {
        "Seller": seller,
        "Product": product,
        "Variety": variety,
        "Price": price,
        "AvgWeight": avgWeight,
        "PerBox": perBox,
        "Boxes": boxes,
        "Delivery": delivery,
      };
}
