import 'dart:convert';

class MenuItem {
  String name;
  double price;
  List<String> ingredients;
  String thumbnailURL;
  List<String> preparation;
  String group = "Menu";

  MenuItem({
    required this.name,
    required this.price,
    required this.ingredients,
    required this.thumbnailURL,
    required this.preparation,
  });

  List<String> get features {
    return [
      ...ingredients.map((e) => e.toLowerCase()),
      ...preparation.map((e) => e.toLowerCase()),
      priceBand
    ];
  }

  String get priceBand {
    if (price < 5.0) return "PRICE_0";
    if (price < 10.0) return "PRICE_1";
    if (price < 15.0) return "PRICE_2";
    if (price < 20.0) return "PRICE_3";
    if (price < 25.0) return "PRICE_4";
    return "PRICE_5";
  }

  factory MenuItem.fromJSON(Map<String, dynamic> json) {
    print(json['name']);
    return MenuItem(
      name: json["name"] as String,
      price: json["price"] as double,
      thumbnailURL: json["thumbnail"] as String,
      preparation: List.from(json["prep"]),
      ingredients: List.from(json["ingredients"]),
    );
  }
}
