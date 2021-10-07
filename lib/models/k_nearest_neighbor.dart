import '../models/menu_item.dart';
import '../models/customer_preferences.dart';

class KNearestNeighbor {
  final List<MenuItem> menuItems;

  KNearestNeighbor(this.menuItems);

  List<MenuItem> recommend(CustomerPreferences preferences) {
    return [preferences.items.first];
  }
}
