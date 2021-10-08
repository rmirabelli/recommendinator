import '../models/menu_item.dart';
import '../models/customer_preferences.dart';

class KNearestNeighbor {
  final List<MenuItem> menuItems;

  KNearestNeighbor(this.menuItems);

  double _computeWeight(MenuItem item, Map<String, double> prefs) {
    double score = 0;
    prefs.forEach((key, value) {
      item.features.contains(key)
          ? score += 1.0 * prefs[key]!
          : score += -1.0 * prefs[key]!;
    });
    return score;
  }

  List<MenuItem> recommend(CustomerPreferences preferences) {
    /// Customer preferences comes to us as a list of order items.
    /// We're going to map these down into a list of ingredients
    /// and preparation methods, both of which are just strings.
    ///
    List<String> allIngredients =
        menuItems.map((e) => e.features).expand((element) => element).toList();
    List<List<String>> preferredItems = preferences.items.map((e) {
      return e.item.features;
    }).toList();
    List<String> preferredIngredients =
        preferredItems.expand((element) => element).toList();
    Map<String, double> counts = Map<String, double>();
    preferredIngredients.forEach(
      (element) {
        counts[element] = (counts[element] ?? 0) + 1;
      },
    );
    List<String> notPreferredIngredients = allIngredients;
    notPreferredIngredients
        .removeWhere((element) => preferredIngredients.contains(element));
    notPreferredIngredients.forEach(
      (element) {
        counts[element] = (counts[element] ?? 0) - 1;
      },
    );
    counts.keys.forEach(
      (element) {
        counts[element] = (counts[element] ?? 0) / preferences.items.length;
      },
    );
    List<Map<String, double>> weights =
        menuItems.map((e) => {e.name: _computeWeight(e, counts)}).toList();
    weights.sort((a, b) => a.values.first.compareTo(b.values.first));
    print(weights);
    return [preferences.items.first.item];
  }
}
