class MenuItem {
  String name;
  double price;
  List<String> ingredients;
  String thumbnailURL;
  List<String> preparation;

  MenuItem({
    required this.name,
    required this.price,
    required this.ingredients,
    required this.thumbnailURL,
    required this.preparation,
  });
}
