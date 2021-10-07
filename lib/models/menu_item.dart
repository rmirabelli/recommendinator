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

  factory MenuItem.fromJSON(Map<String, dynamic> json) {
    return MenuItem(
      name: json["name"] as String,
      price: json["price"] as double,
      thumbnailURL: json["thumbnail"] as String,
      preparation: List.from(json["prep"]),
      ingredients: List.from(json["ingredients"]),
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map['name'] = name;
    map['price'] = price;
    map['thumbnail'] = thumbnailURL;
    map['prep'] = preparation;
    map['ingredients'] = ingredients;
    return map;
  }
}
