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
    return [...ingredients, ...preparation];
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
