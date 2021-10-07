import '../models/menu_item.dart';
import '../models/customer_preferences.dart';

class KNearestNeighbor {
  final List<MenuItem> menuItems;

  KNearestNeighbor(this.menuItems);

  List<MenuItem> recommend(CustomerPreferences preferences) {
    /// Customer preferences comes to us as a list of order items.
    /// We're going to map these down into a list of ingredients
    /// and preparation methods, both of which are just strings.
    ///
    List<List<String>> preferredItems = preferences.items.map((e) {
      return e.item.ingredients;
    }).toList();
    List<String> preferredIngredients =
        preferredItems.expand((element) => element).toList();
    print(preferredIngredients);

    return [preferences.items.first.item];
  }
}
